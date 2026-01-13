import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import '../models/student.dart';
import '../models/progress.dart';
import '../models/badge.dart';
import '../models/challenge.dart';
import 'database_service.dart';
import 'web_storage.dart';
import 'firestore_service.dart';

// Unified storage interface that works on both mobile and web
class StorageService {
  static final StorageService instance = StorageService._init();
  
  StorageService._init();

  // Student operations
  Future<int> createStudent(Student student) async {
    if (kIsWeb) {
      return await WebStorage.instance.createStudent(student);
    } else {
      return await DatabaseService.instance.createStudent(student);
    }
  }

  Future<Student?> getStudentByCredentials(String studentId, String password) async {
    // Try local database first
    if (kIsWeb) {
      final student = await WebStorage.instance.getStudentByCredentials(studentId, password);
      if (student != null) return student;
    } else {
      final student = await DatabaseService.instance.getStudentByCredentials(studentId, password);
      if (student != null) return student;
    }
    
    // If not found locally, check Firebase
    debugPrint('StorageService: User not found locally, checking Firebase...');
    final userData = await FirestoreService.getUserByCredentials(studentId, password);
    if (userData != null) {
      // Found in Firebase, convert to Student object
      debugPrint('StorageService: User found in Firebase, syncing to local database');
      try {
        final student = Student(
          studentId: userData['student_id'] ?? studentId,
          name: userData['name'] ?? 'Unknown',
          className: userData['class_name'] ?? '',
          password: password,
          totalPoints: userData['total_points'] ?? 0,
          createdAt: userData['created_at'] != null 
            ? DateTime.parse(userData['created_at']) 
            : DateTime.now(),
        );
        
        // Save to local database for faster access next time
        if (kIsWeb) {
          await WebStorage.instance.createStudent(student);
        } else {
          await DatabaseService.instance.createStudent(student);
        }
        
        return student;
      } catch (e) {
        debugPrint('StorageService ERROR: Failed to convert Firebase user data: $e');
      }
    }
    
    return null;
  }

  Future<Student?> getStudentById(int id) async {
    if (kIsWeb) {
      return await WebStorage.instance.getStudentById(id);
    } else {
      return await DatabaseService.instance.getStudentById(id);
    }
  }

  Future<int> updateStudent(Student student) async {
    if (kIsWeb) {
      return await WebStorage.instance.updateStudent(student);
    } else {
      return await DatabaseService.instance.updateStudent(student);
    }
  }

  // Progress operations
  Future<int> createOrUpdateProgress(Progress progress) async {
    if (kIsWeb) {
      return await WebStorage.instance.createOrUpdateProgress(progress);
    } else {
      return await DatabaseService.instance.createOrUpdateProgress(progress);
    }
  }

  Future<List<Progress>> getStudentProgress(int studentId) async {
    if (kIsWeb) {
      return await WebStorage.instance.getStudentProgress(studentId);
    } else {
      return await DatabaseService.instance.getStudentProgress(studentId);
    }
  }

  // Badge operations
  Future<List<Badge>> getAllBadges() async {
    if (kIsWeb) {
      return await WebStorage.instance.getAllBadges();
    } else {
      return await DatabaseService.instance.getAllBadges();
    }
  }

  // Stub methods for quiz results and challenges (not implemented for web)
  Future<int> createQuizResult(QuizResult result) async {
    // Stub for web - quiz results not persisted
    return 1;
  }

  Future<List<QuizResult>> getStudentQuizResults(int studentId) async {
    // Stub for web
    return [];
  }

  Future<int> awardBadge(StudentBadge studentBadge) async {
    // Stub for web
    return 1;
  }

  Future<List<StudentBadge>> getStudentBadges(int studentId) async {
    // Stub for web
    return [];
  }

  Future<int> createStudentChallenge(StudentChallenge challenge) async {
    // Stub for web
    return 1;
  }

  Future<int> updateStudentChallenge(StudentChallenge challenge) async {
    // Stub for web
    return 1;
  }

  Future<List<StudentChallenge>> getStudentChallenges(int studentId) async {
    // Stub for web
    return [];
  }
}
