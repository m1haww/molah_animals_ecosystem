import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/animal/animal_page.dart';
import 'package:molah_animals_ecosystem/events/events_page.dart';
import 'package:molah_animals_ecosystem/home/Home.dart';
import 'package:molah_animals_ecosystem/profile/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  // Example profile data (you would get this from ProfileEditPage)
  String profileName = "John"; // Replace with actual dynamic data
  String profileSurname = "Doe"; // Replace with actual dynamic data
  var profileImage; // Can be File or Uint8List

  final List<Widget> _tabViews = [
    Home(),
    AnimalsPage(),
    EventsPage(),
    EventsPage(),
    ProfilePage(),
  ];

  final List<String> _tabIcons = [
    "images/ic_round-home.png",
    "images/lapka.png",
    "images/events.png",
    "images/quiz.png",
    "images/iconamoon_profile-fill.png",
  ];

  final Color _selectedColor = const Color(0xFFE5182B);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          (index) {
            return BottomNavigationBarItem(
              icon: _buildTabIcon(index),
              label: '',
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabIcon(int index) {
    // Check if this icon is selected, if so, apply the red color filter
    return ColorFiltered(
      colorFilter: _currentIndex == index
          ? ColorFilter.mode(
              _selectedColor, BlendMode.srcIn) // Red color on select
          : const ColorFilter.mode(
              Colors.grey, BlendMode.srcIn), // Grey color for unselected
      child: Image.asset(
        _tabIcons[index],
      ),
    );
  }
}
