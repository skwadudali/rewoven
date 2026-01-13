class Category {
  final int? id;
  final String name;
  final String description;
  final String icon;
  final int totalLevels;
  final int totalQuizzes;
  final int totalChallenges;

  Category({
    this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.totalLevels = 3,
    this.totalQuizzes = 24, // 3 levels × 8 quizzes per level
    this.totalChallenges = 3, // 1 challenge per level
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'total_levels': totalLevels,
      'total_quizzes': totalQuizzes,
      'total_challenges': totalChallenges,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      icon: map['icon'],
      totalLevels: map['total_levels'] ?? 3,
      totalQuizzes: map['total_quizzes'] ?? 24,
      totalChallenges: map['total_challenges'] ?? 3,
    );
  }
}

// Predefined categories
class CategoryData {
  static final List<Category> categories = [
    Category(
      id: 1,
      name: 'Fashion & Fast Fashion',
      description: 'Learn about the environmental impact of fast fashion and sustainable choices',
      icon: '👕',
      totalLevels: 3,
    ),
    Category(
      id: 2,
      name: 'Circular Economy',
      description: 'Understand circular economy principles in the textile industry',
      icon: '♻️',
      totalLevels: 3,
    ),
    Category(
      id: 3,
      name: 'Textile Lifecycle',
      description: 'Explore the complete journey of textiles from production to disposal',
      icon: '🌍',
      totalLevels: 3,
    ),
    Category(
      id: 4,
      name: 'Sustainable Brands',
      description: 'Discover brands making a positive environmental impact',
      icon: '🌱',
      totalLevels: 3,
    ),
    Category(
      id: 5,
      name: 'Recycling',
      description: 'Master textile recycling and circular material practices',
      icon: '♻️',
      totalLevels: 3,
    ),
    Category(
      id: 6,
      name: 'Living a Sustainable Lifestyle',
      description: 'Learn practical tips for sustainable daily choices',
      icon: '🌱',
      totalLevels: 3,
    ),
  ];
}
