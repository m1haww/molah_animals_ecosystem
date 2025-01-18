import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/quiz.dart';

class DifficultySelectionPage extends StatelessWidget {
  const DifficultySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDifficultyCard(context, 'Easy', Colors.green),
            _buildDifficultyCard(context, 'Medium', Colors.blue),
            _buildDifficultyCard(context, 'Hard', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyCard(
      BuildContext context, String difficulty, Color color) {
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
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            difficulty,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String difficulty;

  const QuizPage({super.key, required this.difficulty});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0; // To track the score based on correct answers

  @override
  Widget build(BuildContext context) {
    final quiz =
        quizzes.firstWhere((quiz) => quiz.difficulty == widget.difficulty);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.difficulty} Quiz'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currentQuestionIndex + 1}/${quiz.questions.length}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) / quiz.questions.length,
                      backgroundColor: Colors.grey.shade300,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    quiz.questions[currentQuestionIndex].question,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    4,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _checkAnswer(
                                quiz.questions[currentQuestionIndex]
                                    .options[index],
                                quiz.questions[currentQuestionIndex].answer);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              quiz.questions[currentQuestionIndex]
                                  .options[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentQuestionIndex < quiz.questions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    // Quiz finished logic (Optional: show final score)
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Quiz Finished"),
                        content:
                            Text('Your score: $score/${quiz.questions.length}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                // Optionally, reset quiz or navigate back
                                currentQuestionIndex = 0;
                                score = 0;
                              });
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to check if the answer is correct
  void _checkAnswer(String selectedOption, String correctAnswer) {
    if (selectedOption == correctAnswer) {
      setState(() {
        score++; // Increment score if answer is correct
      });
    }

    setState(() {
      if (currentQuestionIndex <
          quizzes
                  .firstWhere((quiz) => quiz.difficulty == widget.difficulty)
                  .questions
                  .length -
              1) {
        currentQuestionIndex++;
      } else {
        // Optional: display quiz completion logic
        // You could add a final message or navigate to another screen here.
      }
    });
  }
}
