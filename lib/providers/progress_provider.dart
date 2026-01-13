import 'package:flutter/material.dart';
import '../models/progress.dart';
import '../models/badge.dart';
import '../models/challenge.dart';
import '../services/storage_service.dart';
import '../services/firestore_service.dart';

class ProgressProvider extends ChangeNotifier {
  List<Progress> _progressList = [];
  List<QuizResult> _quizResults = [];
  List<StudentBadge> _earnedBadges = [];
  List<StudentChallenge> _studentChallenges = [];
  bool _isLoading = false;

  List<Progress> get progressList => _progressList;
  List<QuizResult> get quizResults => _quizResults;
  List<StudentBadge> get earnedBadges => _earnedBadges;
  List<StudentChallenge> get studentChallenges => _studentChallenges;
  bool get isLoading => _isLoading;

  int get totalPoints => _progressList.fold(0, (sum, p) => sum + p.pointsEarned);
  int get totalQuizzesCompleted => _quizResults.length;
  int get totalChallengesCompleted => 
      _studentChallenges.where((c) => c.completed).length;

  Future<void> loadProgress(int studentId) async {
    _isLoading = true;

    try {
      _progressList = await StorageService.instance.getStudentProgress(studentId);
      _quizResults = await StorageService.instance.getStudentQuizResults(studentId);
      _earnedBadges = await StorageService.instance.getStudentBadges(studentId);
      _studentChallenges = await StorageService.instance.getStudentChallenges(studentId);
    } catch (e) {
      debugPrint('Error loading progress: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveQuizResult(QuizResult result) async {
    try {
      await StorageService.instance.createQuizResult(result);
      _quizResults.add(result);
      
      // Save to Firestore
      final studentId = result.studentId.toString();
      await FirestoreService.saveProgress(
        studentId,
        result.quizId.toString(),
        {
          'quizId': result.quizId,
          'score': result.score,
          'totalQuestions': result.totalQuestions,
          'completedAt': DateTime.now().toIso8601String(),
          'percentage': (result.score / result.totalQuestions * 100).round(),
        },
      );
      
      // Update progress
      await _updateProgress(
        result.studentId,
        result.quizId,
        pointsEarned: (result.score / result.totalQuestions * 10).round(),
        quizCompleted: true,
      );
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error saving quiz result: $e');
    }
  }

  Future<void> completeChallenge(
    int studentId,
    int challengeId,
    String proofNotes,
    int points,
  ) async {
    try {
      final existingChallenge = _studentChallenges.firstWhere(
        (c) => c.challengeId == challengeId,
        orElse: () => StudentChallenge(
          studentId: studentId,
          challengeId: challengeId,
        ),
      );

      await FirestoreService.saveProgress(
        studentId.toString(),
        'challenge_$challengeId',
        {
          'challengeId': challengeId,
          'completed': true,
          'completedAt': DateTime.now().toIso8601String(),
          'proofNotes': proofNotes,
          'points': points,
        },
      );

      final updatedChallenge = StudentChallenge(
        id: existingChallenge.id,
        studentId: studentId,
        challengeId: challengeId,
        completed: true,
        completedAt: DateTime.now(),
        proofNotes: proofNotes,
      );

      if (existingChallenge.id == null) {
        await StorageService.instance.createStudentChallenge(updatedChallenge);
      } else {
        await StorageService.instance.updateStudentChallenge(updatedChallenge);
      }

      _studentChallenges.removeWhere((c) => c.challengeId == challengeId);
      _studentChallenges.add(updatedChallenge);

      notifyListeners();
    } catch (e) {
      debugPrint('Error completing challenge: $e');
    }
  }

  Future<void> _updateProgress(
    int studentId,
    int quizId, {
    int? pointsEarned,
    bool quizCompleted = false,
  }) async {
    // This would need quiz/challenge category info
    // Simplified version
    notifyListeners();
  }

  Future<void> checkAndAwardBadges(int studentId, int totalPoints) async {
    try {
      final allBadges = await StorageService.instance.getAllBadges();
      final earnedBadgeIds = _earnedBadges.map((sb) => sb.badgeId).toSet();

      for (var badge in allBadges) {
        if (!earnedBadgeIds.contains(badge.id) && 
            totalPoints >= badge.requiredPoints) {
          final studentBadge = StudentBadge(
            studentId: studentId,
            badgeId: badge.id!,
          );
          
          await StorageService.instance.awardBadge(studentBadge);
          _earnedBadges.add(studentBadge);
        }
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error checking badges: $e');
    }
  }

  Progress? getProgressByCategory(int categoryId) {
    try {
      return _progressList.firstWhere((p) => p.categoryId == categoryId);
    } catch (e) {
      return null;
    }
  }

  List<QuizResult> getRecentQuizResults({int limit = 5}) {
    return _quizResults.take(limit).toList();
  }
}
