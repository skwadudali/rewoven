class Badge {
  final int? id;
  final String name;
  final String description;
  final String icon;
  final int requiredPoints;
  final String category;

  Badge({
    this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.requiredPoints,
    this.category = 'General',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'required_points': requiredPoints,
      'category': category,
    };
  }

  factory Badge.fromMap(Map<String, dynamic> map) {
    return Badge(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      icon: map['icon'],
      requiredPoints: map['required_points'],
      category: map['category'] ?? 'General',
    );
  }
}

class StudentBadge {
  final int? id;
  final int studentId;
  final int badgeId;
  final DateTime earnedAt;

  StudentBadge({
    this.id,
    required this.studentId,
    required this.badgeId,
    DateTime? earnedAt,
  }) : earnedAt = earnedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'badge_id': badgeId,
      'earned_at': earnedAt.toIso8601String(),
    };
  }

  factory StudentBadge.fromMap(Map<String, dynamic> map) {
    return StudentBadge(
      id: map['id'],
      studentId: map['student_id'],
      badgeId: map['badge_id'],
      earnedAt: DateTime.parse(map['earned_at']),
    );
  }
}

// Predefined badges
class BadgeData {
  static final List<Badge> badges = [
    Badge(
      id: 1,
      name: 'Eco Warrior',
      description: 'Complete your first quiz',
      icon: '🌟',
      requiredPoints: 10,
      category: 'Beginner',
    ),
    Badge(
      id: 2,
      name: 'Sustainability Champion',
      description: 'Earn 100 points',
      icon: '🏆',
      requiredPoints: 100,
      category: 'Progress',
    ),
    Badge(
      id: 3,
      name: 'Waste Reducer',
      description: 'Complete 5 challenges',
      icon: '♻️',
      requiredPoints: 100,
      category: 'Challenges',
    ),
    Badge(
      id: 4,
      name: 'Fashion Revolutionist',
      description: 'Master Fast Fashion category',
      icon: '👕',
      requiredPoints: 50,
      category: 'Fast Fashion',
    ),
    Badge(
      id: 5,
      name: 'Circular Thinker',
      description: 'Master Circular Economy category',
      icon: '🔄',
      requiredPoints: 50,
      category: 'Circular Economy',
    ),
    Badge(
      id: 6,
      name: 'Lifecycle Expert',
      description: 'Master Textile Lifecycle category',
      icon: '🌍',
      requiredPoints: 50,
      category: 'Textile Lifecycle',
    ),
    Badge(
      id: 7,
      name: 'Green Shopper',
      description: 'Master Sustainable Brands category',
      icon: '🛍️',
      requiredPoints: 50,
      category: 'Sustainable Brands',
    ),
    Badge(
      id: 8,
      name: 'Upcycling Master',
      description: 'Master Upcycling & Repair category',
      icon: '✂️',
      requiredPoints: 50,
      category: 'Upcycling & Repair',
    ),
    Badge(
      id: 9,
      name: 'Sustainability Legend',
      description: 'Earn 500 points',
      icon: '👑',
      requiredPoints: 500,
      category: 'Achievement',
    ),
  ];
}
