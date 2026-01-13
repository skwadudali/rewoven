import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user data
  static Future<void> saveUser(String userId, Map<String, dynamic> userData) async {
    try {
      debugPrint('FirestoreService: Saving user $userId with data: $userData');
      await _db.collection('users').doc(userId).set(userData, SetOptions(merge: true));
      debugPrint('FirestoreService: Successfully saved user $userId');
    } catch (e) {
      debugPrint('FirestoreService ERROR - Failed to save user $userId: $e');
      rethrow;
    }
  }

  // Get user data
  static Future<Map<String, dynamic>?> getUser(String userId) async {
    try {
      debugPrint('FirestoreService: Fetching user $userId');
      final doc = await _db.collection('users').doc(userId).get();
      debugPrint('FirestoreService: User data retrieved: ${doc.data()}');
      return doc.data();
    } catch (e) {
      debugPrint('FirestoreService ERROR - Failed to get user $userId: $e');
      return null;
    }
  }

  // Get user by credentials (student_id and password)
  static Future<Map<String, dynamic>?> getUserByCredentials(String studentId, String password) async {
    try {
      debugPrint('FirestoreService: Searching for user with student_id: $studentId');
      final query = await _db
          .collection('users')
          .where('student_id', isEqualTo: studentId)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
      
      if (query.docs.isNotEmpty) {
        debugPrint('FirestoreService: User found in Firestore');
        return query.docs.first.data();
      }
      debugPrint('FirestoreService: User not found or password mismatch');
      return null;
    } catch (e) {
      debugPrint('FirestoreService ERROR - Failed to get user by credentials: $e');
      return null;
    }
  }

  // Save quiz progress
  static Future<void> saveProgress(String userId, String quizId, Map<String, dynamic> progressData) async {
    try {
      debugPrint('FirestoreService: Saving progress for user $userId, quiz $quizId');
      await _db
          .collection('users')
          .doc(userId)
          .collection('progress')
          .doc(quizId)
          .set(progressData, SetOptions(merge: true));
      debugPrint('FirestoreService: Successfully saved progress for user $userId, quiz $quizId');
    } catch (e) {
      debugPrint('FirestoreService ERROR - Failed to save progress: $e');
      rethrow;
    }
  }

  // Get quiz progress
  static Future<Map<String, dynamic>?> getProgress(String userId, String quizId) async {
    try {
      debugPrint('FirestoreService: Fetching progress for user $userId, quiz $quizId');
      final doc = await _db
          .collection('users')
          .doc(userId)
          .collection('progress')
          .doc(quizId)
          .get();
      debugPrint('FirestoreService: Progress data retrieved: ${doc.data()}');
      return doc.data();
    } catch (e) {
      debugPrint('FirestoreService ERROR - Failed to get progress: $e');
      return null;
    }
  }

  // Get all user progress
  static Stream<QuerySnapshot> getUserProgressStream(String userId) {
    return _db.collection('users').doc(userId).collection('progress').snapshots();
  }
}
