import 'package:flutter/material.dart';
import '../quiz/quiz_screen.dart';

class CategoryDetailScreen extends StatefulWidget {
  final dynamic category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.green.shade500],
                ),
              ),
              child: Column(
                children: [
                  Text(widget.category.icon, style: const TextStyle(fontSize: 80)),
                  const SizedBox(height: 16),
                  Text(
                    widget.category.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About this Category', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    widget.category.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Level 1'),
                      Tab(text: 'Level 2'),
                      Tab(text: 'Level 3'),
                    ],
                    labelColor: Colors.green.shade700,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.green.shade700,
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    height: 250,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildLevelContent(1),
                        _buildLevelContent(2),
                        _buildLevelContent(3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelContent(int level) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _getLevelDescription(level),
                        style: TextStyle(color: Colors.blue.shade700, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QuizScreen(
                    categoryId: widget.category.id,
                    level: level,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level $level Quiz',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '8 questions',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 14),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white.withValues(alpha: 0.8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLevelDescription(int level) {
    switch (level) {
      case 1:
        return 'Master the basics! Learn fundamental concepts about sustainable fashion.';
      case 2:
        return 'Go deeper! Explore intermediate concepts and connections.';
      case 3:
        return 'Become an expert! Challenge yourself with advanced questions.';
      default:
        return '';
    }
  }
}
