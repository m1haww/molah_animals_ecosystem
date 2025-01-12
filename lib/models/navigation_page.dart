import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/pages/Home.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _tabViews = [
    const Home(
      title: '',
      description: '',
    ),
  ];

  final List<IconData> _tabIcons = [
    CupertinoIcons.home,
    CupertinoIcons.home,
    CupertinoIcons.home,
    CupertinoIcons.home,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabViews[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        height: height * 0.1,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(
          _tabIcons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_tabIcons[index]),
          ),
        ),
      ),
    );
  }
}
