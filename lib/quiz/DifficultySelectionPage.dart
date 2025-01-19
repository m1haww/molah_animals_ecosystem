import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/quiz.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/quiz/quiz_page.dart';

class DifficultySelectionPage extends StatelessWidget {
  const DifficultySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText("Quiz"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildDifficultyCard(context, 'Enchanted Forest', 'Easy',
                        Colors.green, Colors.green.shade100),
                    _buildDifficultyCard(context, 'Enchanted Forest', 'Medium',
                        Colors.orange, Colors.orange.shade100),
                    _buildDifficultyCard(context, 'Enchanted Forest', 'Hard',
                        Colors.red, Colors.red.shade100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyCard(BuildContext context, String title,
      String difficulty, Color color, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(difficulty: difficulty),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  difficulty,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
