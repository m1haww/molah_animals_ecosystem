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

List<Quiz> quizzes = [
  Quiz(
    title: "Forest Animals",
    difficulty: "Easy",
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
    difficulty: "Medium",
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
    difficulty: "Hard",
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
    difficulty: "Medium",
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
    difficulty: "Hard",
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
