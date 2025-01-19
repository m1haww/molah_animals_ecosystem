import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/quiz.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class QuizPage extends StatefulWidget {
  final String difficulty;

  const QuizPage({super.key, required this.difficulty});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool isAnswered = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final quiz =
        quizzes.firstWhere((quiz) => quiz.difficulty == widget.difficulty);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/quiz_fundal.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: buildText("Quiz"),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(currentQuestionIndex + 1).toString().padLeft(2, '0')}/${quiz.questions.length.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / quiz.questions.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  minHeight: 8,
                ),
                SizedBox(height: height * 0.02),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          quiz.questions[currentQuestionIndex].question,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.02),
                        ...List.generate(
                          4,
                          (index) {
                            String option = quiz
                                .questions[currentQuestionIndex].options[index];
                            bool isCorrect = option ==
                                quiz.questions[currentQuestionIndex].answer;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                onPressed: isAnswered
                                    ? null
                                    : () {
                                        _checkAnswer(option, isCorrect);
                                      },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: !isAnswered
                                          ? Colors.white // Default color
                                          : (selectedAnswer == option &&
                                                  isCorrect)
                                              ? Colors.green // Correct answer
                                              : (selectedAnswer == option &&
                                                      !isCorrect)
                                                  ? Colors
                                                      .red // Incorrect answer
                                                  : Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    option,
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
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (currentQuestionIndex < quiz.questions.length - 1) {
                        currentQuestionIndex++;
                        isAnswered = false;
                        selectedAnswer = null;
                      } else {
                        // Quiz finished logic
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Quiz Finished"),
                            content: Text(
                                'Your score: $score/${quiz.questions.length}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    currentQuestionIndex = 0;
                                    score = 0;
                                    isAnswered = false;
                                    selectedAnswer = null;
                                  });
                                },
                                child: const Text(
                                  "Ok",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: buildAddContainer(
                    context,
                    "Next",
                    const Color(0xffFC2527),
                    Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to check if the answer is correct
  void _checkAnswer(String selectedOption, bool isCorrect) {
    setState(() {
      selectedAnswer = selectedOption; // Store the selected option
      isAnswered = true; // Mark the question as answered
      if (isCorrect) {
        score++;
      }
    });
  }
}
