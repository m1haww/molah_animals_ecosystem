import 'package:flutter/material.dart';

class AddSavedPage extends StatelessWidget {
  final String title;
  final String description;

  const AddSavedPage({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Predator Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(description),
          ],
        ),
      ),
    );
  }
}
