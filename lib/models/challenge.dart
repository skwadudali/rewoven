class Challenge {
  final int? id;
  final int categoryId;
  final String title;
  final String description;
  final String actionRequired;
  final int pointsReward;
  final String difficultyLevel;

  Challenge({
    this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.actionRequired,
    this.pointsReward = 20,
    this.difficultyLevel = 'Medium',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'title': title,
      'description': description,
      'action_required': actionRequired,
      'points_reward': pointsReward,
      'difficulty_level': difficultyLevel,
    };
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      id: map['id'],
      categoryId: map['category_id'],
      title: map['title'],
      description: map['description'],
      actionRequired: map['action_required'],
      pointsReward: map['points_reward'] ?? 20,
      difficultyLevel: map['difficulty_level'] ?? 'Medium',
    );
  }
}

class StudentChallenge {
  final int? id;
  final int studentId;
  final int challengeId;
  final bool completed;
  final DateTime? completedAt;
  final String? proofNotes;

  StudentChallenge({
    this.id,
    required this.studentId,
    required this.challengeId,
    this.completed = false,
    this.completedAt,
    this.proofNotes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'challenge_id': challengeId,
      'completed': completed ? 1 : 0,
      'completed_at': completedAt?.toIso8601String(),
      'proof_notes': proofNotes,
    };
  }

  factory StudentChallenge.fromMap(Map<String, dynamic> map) {
    return StudentChallenge(
      id: map['id'],
      studentId: map['student_id'],
      challengeId: map['challenge_id'],
      completed: map['completed'] == 1,
      completedAt: map['completed_at'] != null 
          ? DateTime.parse(map['completed_at']) 
          : null,
      proofNotes: map['proof_notes'],
    );
  }
}
