import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/home/Home.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/utils/onboarding_info_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => const Home()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        
        children: [

          Column(
            children: [
              
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildOnboardingPage1(),
                    _buildOnboardingPage2(),
                    _buildOnboardingPage3(),
                  ],
                ),
              ),
            ],
          ),
          // Positioned container for the bottom card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onboardingPages[_currentPage].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingPages[_currentPage].info,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  buildContainer(
                    context,
                    _navigateToNextPage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Navigate to the next page
  void _navigateToNextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

 Widget _buildOnboardingPage1() {
  return Stack(
    fit: StackFit.expand, // Se asigură că imaginea ocupă tot ecranul
    children: [
      Image.asset(
        'assets/images/background1.jpg', // Înlocuiește cu calea imaginii tale
        fit: BoxFit.cover, // Asigură că imaginea acoperă complet ecranul
      ),
      Center(
        child: Text(
          "Onboarding Page 1",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Contrast pentru text pe un fundal colorat
          ),
        ),
      ),
    ],
  );
}

Widget _buildOnboardingPage2() {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        'assets/images/background2.jpg', // Înlocuiește cu calea imaginii tale
        fit: BoxFit.cover,
      ),
      Center(
        child: Text(
          "Onboarding Page 2",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Widget _buildOnboardingPage3() {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        'assets/images/background3.jpg', // Înlocuiește cu calea imaginii tale
        fit: BoxFit.cover,
      ),
      Center(
        child: Text(
          "Onboarding Page 3",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
