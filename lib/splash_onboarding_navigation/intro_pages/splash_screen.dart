import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:molah_animals_ecosystem/splash_onboarding_navigation/intro_pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showFirstText = false; // Start with "Moolah Animals" invisible
  bool showSecondText = false; // Initially, "Mega Moolah" is also invisible

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // Fade in "Moolah Animals"
    await Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showFirstText = true;
        });
      }
    });

    // Hold "Moolah Animals" visible for 3 seconds, then fade it out
    await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showFirstText = false;
        });
      }
    });

    // Fade in "Mega Moolah"
    await Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showSecondText = true;
        });
      }
    });

    // Hold "Mega Moolah" visible for 3 seconds, then navigate to Onboarding
    await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Onboarding(), // Replace with your onboarding screen
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'images/SplachScreen.png',
            fit: BoxFit.cover,
          ),
          // Animated text
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // "Moolah Animals" text
                AnimatedOpacity(
                  opacity: showFirstText ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2), // Smooth fade in/out
                  child: const Text(
                    'Moolah\nAnimals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 65,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Sf"),
                  ),
                ),
                // "Mega Moolah" text
                AnimatedOpacity(
                  opacity: showSecondText ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2), // Smooth fade in
                  child: const Text(
                    'Mega\nMoolah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 65,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Sf"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
