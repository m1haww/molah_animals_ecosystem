import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class DetailsAboutAnimals extends StatefulWidget {
  const DetailsAboutAnimals({super.key});

  @override
  State<DetailsAboutAnimals> createState() => _DetailsAboutAnimalsState();
}

class _DetailsAboutAnimalsState extends State<DetailsAboutAnimals> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // leading: buildIconBack(context),
        actions: [buildNextbuton("Edit")],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText("Wolf"),
            SizedBox(
              height: height * 0.02,
            ),
            buildImage(
              context,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            buildBigContainerDetails(context),
          ],
        ),
      )),
    );
  }
}
