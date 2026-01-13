import '../models/student.dart';
import '../models/progress.dart';
import '../models/badge.dart';
import '../models/challenge.dart';

// In-memory storage for web platform
class WebStorage {
  static final WebStorage instance = WebStorage._init();
  
  final List<Student> _students = [];
  final List<Progress> _progress = [];
  final List<Badge> _badges = [];
  final List<Challenge> _challenges = [];
  
  int _studentIdCounter = 1;
  
  WebStorage._init();

  // Student operations
  Future<int> createStudent(Student student) async {
    final newStudent = student.copyWith(id: _studentIdCounter);
    _students.add(newStudent);
    _studentIdCounter++;
    return _studentIdCounter - 1;
  }

  Future<Student?> getStudentByCredentials(String studentId, String password) async {
    try {
      return _students.firstWhere(
        (s) => s.studentId == studentId && s.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Student?> getStudentById(int id) async {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<int> updateStudent(Student student) async {
    final index = _students.indexWhere((s) => s.id == student.id);
    if (index != -1) {
      _students[index] = student;
      return 1;
    }
    return 0;
  }

  // Progress operations
  Future<int> createOrUpdateProgress(Progress progress) async {
    final index = _progress.indexWhere(
      (p) => p.studentId == progress.studentId && p.categoryId == progress.categoryId,
    );
    
    if (index != -1) {
      _progress[index] = progress;
    } else {
      _progress.add(progress);
    }
    return 1;
  }

  Future<List<Progress>> getStudentProgress(int studentId) async {
    return _progress.where((p) => p.studentId == studentId).toList();
  }

  // Badge operations
  Future<List<Badge>> getAllBadges() async {
    return _badges;
  }

  Future<int> awardBadge(Badge badge) async {
    _badges.add(badge);
    return _badges.length;
  }

  Future<List<Badge>> getStudentBadges(int studentId) async {
    return _badges;
  }

  // Challenge operations
  Future<int> createStudentChallenge(Challenge challenge) async {
    _challenges.add(challenge);
    return _challenges.length;
  }

  Future<int> updateStudentChallenge(Challenge challenge) async {
    final index = _challenges.indexWhere((c) => c.id == challenge.id);
    if (index != -1) {
      _challenges[index] = challenge;
      return 1;
    }
    return 0;
  }

  Future<List<Challenge>> getStudentChallenges(int studentId) async {
    return _challenges;
  }
}
