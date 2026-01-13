import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';
import '../models/quiz.dart';
import '../models/challenge.dart';
import '../models/badge.dart';
import '../models/progress.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('rewoven.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Students table
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id TEXT UNIQUE NOT NULL,
        name TEXT NOT NULL,
        class_name TEXT NOT NULL,
        password TEXT NOT NULL,
        total_points INTEGER DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');

    // Categories table
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        icon TEXT NOT NULL,
        total_quizzes INTEGER DEFAULT 0,
        total_challenges INTEGER DEFAULT 0
      )
    ''');

    // Quizzes table
    await db.execute('''
      CREATE TABLE quizzes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        points_reward INTEGER DEFAULT 10,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    // Questions table
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quiz_id INTEGER NOT NULL,
        question TEXT NOT NULL,
        options TEXT NOT NULL,
        correct_answer_index INTEGER NOT NULL,
        explanation TEXT NOT NULL,
        FOREIGN KEY (quiz_id) REFERENCES quizzes (id)
      )
    ''');

    // Challenges table
    await db.execute('''
      CREATE TABLE challenges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        action_required TEXT NOT NULL,
        points_reward INTEGER DEFAULT 20,
        difficulty_level TEXT DEFAULT 'Medium',
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    // Student Challenges table
    await db.execute('''
      CREATE TABLE student_challenges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        challenge_id INTEGER NOT NULL,
        completed INTEGER DEFAULT 0,
        completed_at TEXT,
        proof_notes TEXT,
        FOREIGN KEY (student_id) REFERENCES students (id),
        FOREIGN KEY (challenge_id) REFERENCES challenges (id)
      )
    ''');

    // Badges table
    await db.execute('''
      CREATE TABLE badges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        icon TEXT NOT NULL,
        required_points INTEGER NOT NULL,
        category TEXT DEFAULT 'General'
      )
    ''');

    // Student Badges table
    await db.execute('''
      CREATE TABLE student_badges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        badge_id INTEGER NOT NULL,
        earned_at TEXT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES students (id),
        FOREIGN KEY (badge_id) REFERENCES badges (id)
      )
    ''');

    // Progress table
    await db.execute('''
      CREATE TABLE progress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        category_id INTEGER NOT NULL,
        quizzes_completed INTEGER DEFAULT 0,
        challenges_completed INTEGER DEFAULT 0,
        points_earned INTEGER DEFAULT 0,
        last_activity_at TEXT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES students (id),
        FOREIGN KEY (category_id) REFERENCES categories (id),
        UNIQUE(student_id, category_id)
      )
    ''');

    // Quiz Results table
    await db.execute('''
      CREATE TABLE quiz_results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        quiz_id INTEGER NOT NULL,
        score INTEGER NOT NULL,
        total_questions INTEGER NOT NULL,
        completed_at TEXT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES students (id),
        FOREIGN KEY (quiz_id) REFERENCES quizzes (id)
      )
    ''');

    // Insert initial data
    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async {
    // Insert categories
    final categories = [
      {'id': 1, 'name': 'Fast Fashion', 'description': 'Learn about the environmental impact of fast fashion', 'icon': '👕', 'total_quizzes': 5, 'total_challenges': 3},
      {'id': 2, 'name': 'Circular Economy', 'description': 'Understand circular economy principles', 'icon': '♻️', 'total_quizzes': 5, 'total_challenges': 4},
      {'id': 3, 'name': 'Textile Lifecycle', 'description': 'Explore the complete journey of textiles', 'icon': '🌍', 'total_quizzes': 5, 'total_challenges': 3},
      {'id': 4, 'name': 'Sustainable Brands', 'description': 'Discover brands making a positive impact', 'icon': '🌱', 'total_quizzes': 5, 'total_challenges': 4},
      {'id': 5, 'name': 'Upcycling & Repair', 'description': 'Master practical upcycling skills', 'icon': '✂️', 'total_quizzes': 5, 'total_challenges': 5},
    ];

    for (var category in categories) {
      await db.insert('categories', category);
    }

    // Insert badges
    final badges = BadgeData.badges;
    for (var badge in badges) {
      await db.insert('badges', badge.toMap());
    }
  }

  // Student CRUD operations
  Future<int> createStudent(Student student) async {
    final db = await database;
    return await db.insert('students', student.toMap());
  }

  Future<Student?> getStudentByCredentials(String studentId, String password) async {
    final db = await database;
    final maps = await db.query(
      'students',
      where: 'student_id = ? AND password = ?',
      whereArgs: [studentId, password],
    );

    if (maps.isNotEmpty) {
      return Student.fromMap(maps.first);
    }
    return null;
  }

  Future<Student?> getStudentById(int id) async {
    final db = await database;
    final maps = await db.query(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Student.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateStudent(Student student) async {
    final db = await database;
    return await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  // Quiz operations
  Future<int> createQuiz(Quiz quiz) async {
    final db = await database;
    return await db.insert('quizzes', quiz.toMap());
  }

  Future<List<Quiz>> getQuizzesByCategory(int categoryId) async {
    final db = await database;
    final maps = await db.query(
      'quizzes',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    return List.generate(maps.length, (i) => Quiz.fromMap(maps[i]));
  }

  Future<Quiz?> getQuizById(int id) async {
    final db = await database;
    final maps = await db.query(
      'quizzes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      final quiz = Quiz.fromMap(maps.first);
      final questions = await getQuestionsByQuizId(id);
      return Quiz(
        id: quiz.id,
        categoryId: quiz.categoryId,
        title: quiz.title,
        description: quiz.description,
        questions: questions,
        pointsReward: quiz.pointsReward,
      );
    }
    return null;
  }

  // Question operations
  Future<int> createQuestion(Question question) async {
    final db = await database;
    return await db.insert('questions', question.toMap());
  }

  Future<List<Question>> getQuestionsByQuizId(int quizId) async {
    final db = await database;
    final maps = await db.query(
      'questions',
      where: 'quiz_id = ?',
      whereArgs: [quizId],
    );

    return List.generate(maps.length, (i) => Question.fromMap(maps[i]));
  }

  // Challenge operations
  Future<int> createChallenge(Challenge challenge) async {
    final db = await database;
    return await db.insert('challenges', challenge.toMap());
  }

  Future<List<Challenge>> getChallengesByCategory(int categoryId) async {
    final db = await database;
    final maps = await db.query(
      'challenges',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    return List.generate(maps.length, (i) => Challenge.fromMap(maps[i]));
  }

  Future<List<Challenge>> getAllChallenges() async {
    final db = await database;
    final maps = await db.query('challenges');
    return List.generate(maps.length, (i) => Challenge.fromMap(maps[i]));
  }

  // Student Challenge operations
  Future<int> createStudentChallenge(StudentChallenge studentChallenge) async {
    final db = await database;
    return await db.insert('student_challenges', studentChallenge.toMap());
  }

  Future<int> updateStudentChallenge(StudentChallenge studentChallenge) async {
    final db = await database;
    return await db.update(
      'student_challenges',
      studentChallenge.toMap(),
      where: 'id = ?',
      whereArgs: [studentChallenge.id],
    );
  }

  Future<List<StudentChallenge>> getStudentChallenges(int studentId) async {
    final db = await database;
    final maps = await db.query(
      'student_challenges',
      where: 'student_id = ?',
      whereArgs: [studentId],
    );

    return List.generate(maps.length, (i) => StudentChallenge.fromMap(maps[i]));
  }

  // Progress operations
  Future<int> createOrUpdateProgress(Progress progress) async {
    final db = await database;
    final existing = await db.query(
      'progress',
      where: 'student_id = ? AND category_id = ?',
      whereArgs: [progress.studentId, progress.categoryId],
    );

    if (existing.isNotEmpty) {
      return await db.update(
        'progress',
        progress.toMap(),
        where: 'student_id = ? AND category_id = ?',
        whereArgs: [progress.studentId, progress.categoryId],
      );
    } else {
      return await db.insert('progress', progress.toMap());
    }
  }

  Future<List<Progress>> getStudentProgress(int studentId) async {
    final db = await database;
    final maps = await db.query(
      'progress',
      where: 'student_id = ?',
      whereArgs: [studentId],
    );

    return List.generate(maps.length, (i) => Progress.fromMap(maps[i]));
  }

  // Quiz Result operations
  Future<int> createQuizResult(QuizResult result) async {
    final db = await database;
    return await db.insert('quiz_results', result.toMap());
  }

  Future<List<QuizResult>> getStudentQuizResults(int studentId) async {
    final db = await database;
    final maps = await db.query(
      'quiz_results',
      where: 'student_id = ?',
      whereArgs: [studentId],
      orderBy: 'completed_at DESC',
    );

    return List.generate(maps.length, (i) => QuizResult.fromMap(maps[i]));
  }

  // Badge operations
  Future<List<Badge>> getAllBadges() async {
    final db = await database;
    final maps = await db.query('badges');
    return List.generate(maps.length, (i) => Badge.fromMap(maps[i]));
  }

  Future<int> awardBadge(StudentBadge studentBadge) async {
    final db = await database;
    return await db.insert('student_badges', studentBadge.toMap());
  }

  Future<List<StudentBadge>> getStudentBadges(int studentId) async {
    final db = await database;
    final maps = await db.query(
      'student_badges',
      where: 'student_id = ?',
      whereArgs: [studentId],
    );

    return List.generate(maps.length, (i) => StudentBadge.fromMap(maps[i]));
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
