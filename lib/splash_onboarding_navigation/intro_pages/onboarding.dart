import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/splash_onboarding_navigation/intro_pages/navigation_page.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          if (_currentPage < 2)
            GestureDetector(
              onTap: () {
                _pageController.jumpToPage(2);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Skip",
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Sf",
                      color: Color(0xffFAFAFA),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: height * 0.38,
              decoration: const BoxDecoration(
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
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Sf"),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    onboardingPages[_currentPage].info,
                    style: const TextStyle(
                        fontSize: 13,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff585858)),
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
          builder: (context) => const NavigationPage(),
        ),
      );
    }
  }

  Widget _buildOnboardingPage1() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/Onboarding1.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildOnboardingPage2() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/Onboarding_2.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildOnboardingPage3() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/Onboarding_3.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
