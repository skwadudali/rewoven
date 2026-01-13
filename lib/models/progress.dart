class Progress {
  final int? id;
  final int studentId;
  final int categoryId;
  final int quizzesCompleted;
  final int challengesCompleted;
  final int pointsEarned;
  final DateTime lastActivityAt;

  Progress({
    this.id,
    required this.studentId,
    required this.categoryId,
    this.quizzesCompleted = 0,
    this.challengesCompleted = 0,
    this.pointsEarned = 0,
    DateTime? lastActivityAt,
  }) : lastActivityAt = lastActivityAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'category_id': categoryId,
      'quizzes_completed': quizzesCompleted,
      'challenges_completed': challengesCompleted,
      'points_earned': pointsEarned,
      'last_activity_at': lastActivityAt.toIso8601String(),
    };
  }

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      id: map['id'],
      studentId: map['student_id'],
      categoryId: map['category_id'],
      quizzesCompleted: map['quizzes_completed'] ?? 0,
      challengesCompleted: map['challenges_completed'] ?? 0,
      pointsEarned: map['points_earned'] ?? 0,
      lastActivityAt: DateTime.parse(map['last_activity_at']),
    );
  }
}

class QuizResult {
  final int? id;
  final int studentId;
  final int quizId;
  final int score;
  final int totalQuestions;
  final DateTime completedAt;

  QuizResult({
    this.id,
    required this.studentId,
    required this.quizId,
    required this.score,
    required this.totalQuestions,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'quiz_id': quizId,
      'score': score,
      'total_questions': totalQuestions,
      'completed_at': completedAt.toIso8601String(),
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      id: map['id'],
      studentId: map['student_id'],
      quizId: map['quiz_id'],
      score: map['score'],
      totalQuestions: map['total_questions'],
      completedAt: DateTime.parse(map['completed_at']),
    );
  }

  double get percentage => (score / totalQuestions) * 100;
}
