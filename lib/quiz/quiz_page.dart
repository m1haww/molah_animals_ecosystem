import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/quiz.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/quiz/DifficultySelectionPage.dart';

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
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "images/ez.png",
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText("Quiz"),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
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
                    backgroundColor: Color(0xffBE1E00),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 8,
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
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
                              fontWeight: FontWeight.w600,
                              fontFamily: "Sf"),
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
                                          ? Color(0xffE1E1E1)
                                          : (selectedAnswer == option &&
                                                  isCorrect)
                                              ? Color(0xff5BCC20)
                                              : (selectedAnswer == option &&
                                                      !isCorrect)
                                                  ? Color(0xffFC2527)
                                                  : Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isAnswered) {
                          // If no answer is selected, show a message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('You need to choose an answer!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          if (currentQuestionIndex <
                              quiz.questions.length - 1) {
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
                                      Navigator.pop(
                                          context); // HERE  IDK HOW TO GET BACK TO THE MAIN PAGE WHILE BEEING WITH THE NAVIGATION BAR
                                      setState(() {
                                        currentQuestionIndex = 0;
                                        score = 0;
                                        isAnswered = false;
                                        selectedAnswer = null;
                                      });
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Sf"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
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
      ],
    );
  }

  void _checkAnswer(String selectedOption, bool isCorrect) {
    setState(() {
      selectedAnswer = selectedOption;
      isAnswered = true;
      if (isCorrect) {
        score++;
      }
    });
  }
}
