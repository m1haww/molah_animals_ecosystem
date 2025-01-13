import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/container.dart';

class DetailsAddPage extends StatefulWidget {
  const DetailsAddPage({super.key});

  @override
  State<DetailsAddPage> createState() => _DetailsAddPageState();
}

class _DetailsAddPageState extends State<DetailsAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context),
      ),
    );
  }
}
