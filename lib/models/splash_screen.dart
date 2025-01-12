import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/onboarding.dart';
import 'dart:async';

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
    return const Center(
      child: Text(
        'Moolah\nAnimals',
        style: TextStyle(
          fontSize: 65,
        ),
      ),
    );
  }

  // Second page:
  Widget _buildOnboardingPage2() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Image.asset('assets/left_image.png', width: 150, height: 150),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Image.asset('assets/right_image.png', width: 150, height: 150),
          ),
        ),
      ],
    );
  }

  // Third page:
  Widget _buildOnboardingPage3() {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Mega\nMoolah',
                style: TextStyle(
                  fontSize: 65,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const splashscreen(),
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
                    ), // Text color
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
