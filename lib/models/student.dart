class Student {
  final int? id;
  final String studentId;
  final String name;
  final String className;
  final String password;
  final int totalPoints;
  final DateTime createdAt;

  Student({
    this.id,
    required this.studentId,
    required this.name,
    required this.className,
    required this.password,
    this.totalPoints = 0,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'name': name,
      'class_name': className,
      'password': password,
      'total_points': totalPoints,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      studentId: map['student_id'],
      name: map['name'],
      className: map['class_name'],
      password: map['password'],
      totalPoints: map['total_points'] ?? 0,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Student copyWith({
    int? id,
    String? studentId,
    String? name,
    String? className,
    String? password,
    int? totalPoints,
    DateTime? createdAt,
  }) {
    return Student(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      name: name ?? this.name,
      className: className ?? this.className,
      password: password ?? this.password,
      totalPoints: totalPoints ?? this.totalPoints,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
