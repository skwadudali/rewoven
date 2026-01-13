import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/student.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';

class AuthProvider extends ChangeNotifier {
  Student? _currentStudent;
  bool _isLoading = false;

  Student? get currentStudent => _currentStudent;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentStudent != null;

  Future<void> checkLoginStatus() async {
    _isLoading = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      final storedId = prefs.getInt('student_id');

      if (storedId != null) {
        final localStudent = await StorageService.instance.getStudentById(storedId);
        if (localStudent != null) {
          _currentStudent = localStudent;
        }
      }
    } catch (e) {
      debugPrint('Error checking login status: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login(String studentId, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final student = await StorageService.instance.getStudentByCredentials(
        studentId,
        password,
      );

      if (student != null) {
        _currentStudent = student;

        final prefs = await SharedPreferences.getInstance();
        if (student.id != null) {
          await prefs.setInt('student_id', student.id!);
        }

        final externalId = student.studentId ?? student.id?.toString();
        if (externalId != null) {
          // Sync user to Firestore (fire-and-forget but with logging)
          unawaited(
            FirestoreService.saveUser(externalId, student.toMap()).catchError(
              (e) {
                debugPrint('Error syncing user to Firestore during login: $e');
                debugPrint('Note: User can still use app but data may not be backed up to Firebase');
              },
            ),
          );
        }

        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Error during login: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(Student student) async {
    _isLoading = true;
    notifyListeners();

    try {
      final id = await StorageService.instance.createStudent(student);

      if (id > 0) {
        final newStudent = student.copyWith(id: id);
        _currentStudent = newStudent;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('student_id', id);

        final externalId = newStudent.studentId ?? newStudent.id?.toString();
        if (externalId != null) {
          // Sync user to Firestore
          try {
            debugPrint('AuthProvider: Attempting to save user $externalId to Firestore');
            await FirestoreService.saveUser(externalId, newStudent.toMap());
            debugPrint('AuthProvider: Successfully saved user $externalId to Firestore');
          } catch (e) {
            debugPrint('AuthProvider ERROR: Failed to sync user to Firestore: $e');
          }
        }

        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Error during registration: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _currentStudent = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('student_id');
    notifyListeners();
  }

  Future<void> updatePoints(int points) async {
    if (_currentStudent != null) {
      final updatedStudent = _currentStudent!.copyWith(
        totalPoints: _currentStudent!.totalPoints + points,
      );

      await StorageService.instance.updateStudent(updatedStudent);
      _currentStudent = updatedStudent;
      notifyListeners();
    }
  }
}
