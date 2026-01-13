class Quiz {
  final int? id;
  final int categoryId;
  final String title;
  final String description;
  final List<Question> questions;
  final int pointsReward;
  final int level; // 1, 2, or 3

  Quiz({
    this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.questions,
    this.pointsReward = 10,
    this.level = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'title': title,
      'description': description,
      'points_reward': pointsReward,
      'level': level,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      categoryId: map['category_id'],
      title: map['title'],
      description: map['description'],
      questions: [],
      pointsReward: map['points_reward'] ?? 10,
      level: map['level'] ?? 1,
    );
  }
}

class Question {
  final int? id;
  final int quizId;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  Question({
    this.id,
    required this.quizId,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz_id': quizId,
      'question': question,
      'options': options.join('|||'),
      'correct_answer_index': correctAnswerIndex,
      'explanation': explanation,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      quizId: map['quiz_id'],
      question: map['question'],
      options: (map['options'] as String).split('|||'),
      correctAnswerIndex: map['correct_answer_index'],
      explanation: map['explanation'],
    );
  }
}
