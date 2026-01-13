import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../models/progress.dart';
import '../../services/quiz_data.dart';

class QuizScreen extends StatefulWidget {
  final int categoryId;
  final int level;

  const QuizScreen({
    super.key,
    required this.categoryId,
    required this.level,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswer;
  late List<QuizQuestion> _questions;

  @override
  void initState() {
    super.initState();
    _questions = _getQuizQuestions(widget.categoryId, widget.level);
  }

  List<QuizQuestion> _getQuizQuestions(int categoryId, int level) {
    switch (categoryId) {
      case 1:
        return level == 1 
          ? AllQuizzes.fashionLevel1 
          : level == 2 
            ? AllQuizzes.fashionLevel2 
            : AllQuizzes.fashionLevel3;
      case 2:
        return level == 1 
          ? AllQuizzes.circularLevel1 
          : level == 2 
            ? AllQuizzes.circularLevel2 
            : AllQuizzes.circularLevel3;
      case 3:
        return level == 1 
          ? AllQuizzes.textileLevel1 
          : level == 2 
            ? AllQuizzes.textileLevel2 
            : AllQuizzes.textileLevel3;
      case 4:
        return level == 1 
          ? AllQuizzes.sustainableBrandsLevel1 
          : level == 2 
            ? AllQuizzes.sustainableBrandsLevel2 
            : AllQuizzes.sustainableBrandsLevel3;
      case 5:
        return level == 1 
          ? AllQuizzes.recyclingLevel1 
          : level == 2 
            ? AllQuizzes.recyclingLevel2 
            : AllQuizzes.recyclingLevel3;
      case 6:
        return level == 1 
          ? AllQuizzes.sustainableLivingLevel1 
          : level == 2 
            ? AllQuizzes.sustainableLivingLevel2 
            : AllQuizzes.sustainableLivingLevel3;
      default:
        return [];
    }
  }

  void _selectAnswer(int index) {
    if (_answered) return;
    
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      
      if (index == _questions[_currentQuestionIndex].correctIndex) {
        _score += 10;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _answered = false;
        _selectedAnswer = null;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    final authProvider = context.read<AuthProvider>();
    final progressProvider = context.read<ProgressProvider>();
    int totalPoints = _score;
    
    // Save quiz result to Firestore
    if (authProvider.currentStudent != null) {
      final quizResult = QuizResult(
        studentId: authProvider.currentStudent!.id!,
        quizId: widget.categoryId * 100 + widget.level, // Unique quiz ID
        score: _score,
        totalQuestions: _questions.length * 10,
        completedAt: DateTime.now(),
      );
      
      progressProvider.saveQuizResult(quizResult);
      authProvider.updatePoints(totalPoints);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Complete!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Score: $_score/${_questions.length * 10}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Points Earned: $totalPoints",
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 16),
            if (widget.level < 3)
              Text(
                "Level ${widget.level} Complete! Ready for Level ${widget.level + 1}?",
                style: const TextStyle(color: Colors.blue),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.settings.name == '/home' || route.isFirst);
              // If we reach the root without finding /home, navigate to home
              if (!Navigator.of(context).canPop()) {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            },
            child: const Text("Back to Home"),
          ),
          if (widget.level < 3)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      categoryId: widget.categoryId,
                      level: widget.level + 1,
                    ),
                  ),
                );
              },
              child: const Text("Next Level"),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz"), backgroundColor: Colors.green.shade700),
        body: const Center(child: Text("No questions available")),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Level ${widget.level} Quiz"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Question ${_currentQuestionIndex + 1}/${_questions.length}"),
                Text("Score: $_score", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(Colors.green.shade700),
            ),
            const SizedBox(height: 24),

            Text(currentQuestion.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            ...List.generate(
              currentQuestion.options.length,
              (index) => GestureDetector(
                onTap: () => _selectAnswer(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _getOptionColor(index),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _getOptionBorderColor(index), width: 2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _getOptionColor(index) == Colors.white ? Colors.green.shade700 : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(String.fromCharCode(65 + index), style: TextStyle(fontWeight: FontWeight.bold, color: _getOptionColor(index) == Colors.white ? Colors.white : Colors.green.shade700)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(currentQuestion.options[index], style: TextStyle(fontSize: 16, color: _getOptionTextColor(index)))),
                      if (_selectedAnswer == index)
                        Icon(
                          index == currentQuestion.correctIndex ? Icons.check_circle : Icons.cancel,
                          color: index == currentQuestion.correctIndex ? Colors.green : Colors.red,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            if (_answered)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedAnswer == currentQuestion.correctIndex
                        ? "Correct!"
                        : "Incorrect. Correct: ${String.fromCharCode(65 + currentQuestion.correctIndex)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedAnswer == currentQuestion.correctIndex ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Explanation: ${currentQuestion.explanation}", style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            const SizedBox(height: 24),

            if (_answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, padding: const EdgeInsets.symmetric(vertical: 12)),
                  onPressed: _nextQuestion,
                  child: Text(
                    _currentQuestionIndex == _questions.length - 1 ? "Complete Quiz" : "Next Question",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getOptionColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _questions[_currentQuestionIndex].correctIndex) return Colors.green.shade100;
    if (index == _selectedAnswer) return Colors.red.shade100;
    return Colors.white;
  }

  Color _getOptionBorderColor(int index) {
    if (!_answered) return Colors.grey.shade300;
    if (index == _questions[_currentQuestionIndex].correctIndex) return Colors.green;
    if (index == _selectedAnswer) return Colors.red;
    return Colors.grey.shade300;
  }

  Color _getOptionTextColor(int index) {
    if (!_answered) return Colors.black;
    if (index == _questions[_currentQuestionIndex].correctIndex) return Colors.green.shade700;
    if (index == _selectedAnswer) return Colors.red.shade700;
    return Colors.black;
  }
}
