import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/navigation_page.dart';
import 'package:molah_animals_ecosystem/pages/add_page.dart';
import 'package:molah_animals_ecosystem/pages/add_victim.dart';
import 'package:molah_animals_ecosystem/pages/select_connection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
