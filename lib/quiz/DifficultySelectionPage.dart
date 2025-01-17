import 'package:flutter/material.dart';

class DifficultySelectionPage extends StatelessWidget {
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

  const QuizPage({required this.difficulty});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int totalQuestions = 10;

  List<Quiz> quizzes = [
    Quiz(
      title: "Forest Animals",
      difficulty: "easy",
      questions: [
        Question(
          question: "What is the largest predator in the forest?",
          options: ["Wolf", "Bear", "Fox", "Lynx"],
          answer: "Bear",
        ),
        Question(
          question:
              "Which animal commonly uses its tail for balance when jumping between trees?",
          options: ["Squirrel", "Raccoon", "Chipmunk", "Hare"],
          answer: "Squirrel",
        ),
        Question(
          question: "Which animals usually sleep in trees?",
          options: ["Hares", "Deer", "Birds", "Bears"],
          answer: "Birds",
        ),
        Question(
          question: "Which animal is known for its ability to build dams?",
          options: ["Beaver", "Otter", "Fox", "Hare"],
          answer: "Beaver",
        ),
        Question(
          question: "Who is the main predator of rodents in the forest?",
          options: ["Fox", "Bear", "Wolf", "Lynx"],
          answer: "Fox",
        ),
      ],
    ),
    Quiz(
      title: "Savanna Animals",
      difficulty: "medium",
      questions: [
        Question(
          question: "Who is considered the fastest land animal in the savanna?",
          options: ["Lion", "Cheetah", "Antelope", "Elephant"],
          answer: "Cheetah",
        ),
        Question(
          question: "What is the largest land animal?",
          options: ["Giraffe", "Elephant", "Hippopotamus", "Rhinoceros"],
          answer: "Elephant",
        ),
        Question(
          question: "Which animal sleeps the least among savanna animals?",
          options: ["Zebra", "Hyena", "Giraffe", "Lion"],
          answer: "Giraffe",
        ),
        Question(
          question: "Which animal is the main predator of the savanna?",
          options: ["Lion", "Cheetah", "Hyena", "Zebra"],
          answer: "Lion",
        ),
        Question(
          question:
              "Which animal often builds complex burrow systems underground?",
          options: ["Moles", "Meerkats", "Snakes", "Hippopotamuses"],
          answer: "Meerkats",
        ),
        Question(
          question: "Who is the largest herbivore in the savanna?",
          options: ["Elephant", "Giraffe", "Zebra", "Antelope"],
          answer: "Elephant",
        ),
      ],
    ),
    Quiz(
      title: "Marine Creatures",
      difficulty: "hard",
      questions: [
        Question(
          question: "What is the largest mammal in the world?",
          options: ["Orca", "Dolphin", "Blue Whale", "Shark"],
          answer: "Blue Whale",
        ),
        Question(
          question: "Which sea creature has eight tentacles?",
          options: ["Shrimp", "Squid", "Jellyfish", "Octopus"],
          answer: "Octopus",
        ),
        Question(
          question:
              "Which fish is known for its ability to generate electricity?",
          options: ["Shark", "Electric Eel", "Ray", "Tuna"],
          answer: "Electric Eel",
        ),
        Question(
          question: "Which of these animals are filter feeders?",
          options: ["Shark", "Orca", "Whales", "Dolphin"],
          answer: "Whales",
        ),
        Question(
          question: "Which animal uses sand as camouflage?",
          options: ["Seahorse", "Flounder", "Cuttlefish", "Crab"],
          answer: "Flounder",
        ),
      ],
    ),
    Quiz(
      title: "Desert Animals",
      difficulty: "medium",
      questions: [
        Question(
          question: "Which desert animal can go a long time without water?",
          options: ["Scorpion", "Camel", "Fox", "Snake"],
          answer: "Camel",
        ),
        Question(
          question: "Which predator mostly hunts at night in the desert?",
          options: ["Lion", "Cheetah", "Fennec Fox", "Meerkat"],
          answer: "Fennec Fox",
        ),
        Question(
          question: "Which animal has long ears to help cool its body?",
          options: ["Fennec Fox", "Camel", "Cheetah", "Snake"],
          answer: "Fennec Fox",
        ),
        Question(
          question: "Which of these animals is venomous?",
          options: ["Scorpion", "Camel", "Fennec Fox", "Desert Mouse"],
          answer: "Scorpion",
        ),
        Question(
          question: "Which snake is the fastest among desert snakes?",
          options: ["Rattlesnake", "Sand Snake", "Cobra", "Anaconda"],
          answer: "Sand Snake",
        ),
      ],
    ),
    Quiz(
      title: "Arctic and Antarctic Animals",
      difficulty: "hard",
      questions: [
        Question(
          question: "What is the largest predator in the Arctic?",
          options: ["Polar Bear", "Penguin", "Walrus", "Reindeer"],
          answer: "Polar Bear",
        ),
        Question(
          question: "Which animal hunts fish while swimming under the ice?",
          options: ["Sea Lion", "Penguin", "Seal", "Polar Bear"],
          answer: "Seal",
        ),
        Question(
          question: "Which of these animals only lives in Antarctica?",
          options: ["Seal", "Polar Bear", "Penguin", "Orca"],
          answer: "Penguin",
        ),
        Question(
          question:
              "Which animal has a thick layer of blubber to protect against the cold?",
          options: ["Seal", "Penguin", "Walrus", "Reindeer"],
          answer: "Walrus",
        ),
        Question(
          question: "Who is the main predator of penguins?",
          options: ["Seal", "Orca", "Polar Bear", "Walrus"],
          answer: "Orca",
        ),
      ],
    ),
  ];

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
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / quiz.questions.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
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
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
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
                            quiz.questions[currentQuestionIndex].options[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
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
                    // Quiz finished logic
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
}

class Quiz {
  final String title;
  final String difficulty;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.difficulty,
    required this.questions,
  });
}

class Question {
  final String question;
  final List<String> options;
  final String answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}
