import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:molah_animals_ecosystem/splash_onboarding_navigation/intro_pages/navigation_page.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }

  // First page:
  Widget _buildOnboardingPage1() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'images/ez.png', // Replace with your actual image path
          fit: BoxFit.cover,
        ),
        // Centered text
        const Center(
          child: Text(
            'Moolah\nAnimals',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 65,
              color:
                  Colors.white, // Optional: Adjust color for better visibility
              fontWeight: FontWeight.bold, // Optional: Add more emphasis
            ),
          ),
        ),
      ],
    );
  }

  // Second page:
  Widget _buildOnboardingPage2() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'images/ez.png',
          fit: BoxFit.cover,
        ),
        // Centered text
        const Center(
          child: Text(
            'Moolah\nAnimals',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 65,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Third page:
  Widget _buildOnboardingPage3() {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'images/ez.png', // Replace with your actual image path
          fit: BoxFit.cover,
        ),
        // Content over the background
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Centered text
            Expanded(
              child: Center(
                child: const Text(
                  'Mega\nMoolah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // "Continue" button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => NavigationPage(),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffE5182B),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
