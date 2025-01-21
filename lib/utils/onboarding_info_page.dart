class OnboardingInfoPage {
  final String title;
  final String info;

  OnboardingInfoPage({required this.title, required this.info});
}

List<OnboardingInfoPage> onboardingPages = [
  OnboardingInfoPage(
    title: "Explore the Food \nChain",
    info:
        "Get to know the amazing world of nutrition in nature. Explore different food chains, discover new facts about the relationships between animals.",
  ),
  OnboardingInfoPage(
    title: "Create your own \nEcosystem",
    info:
        "Immerse yourself in the creative process and create your own unique food chain. Choose animals, establish their relationships and observe how they interact in your own ecosystem.",
  ),
  OnboardingInfoPage(
    title: "Test your \nknowledge",
    info:
        "Take exciting quizzes to test your knowledge of the animal world. Find out interesting facts and become a real expert.",
  ),
];
