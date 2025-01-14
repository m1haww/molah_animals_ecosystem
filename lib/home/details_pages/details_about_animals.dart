import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class DetailsAboutAnimals extends StatefulWidget {
  final Predator predator;

  const DetailsAboutAnimals({super.key, required this.predator});

  @override
  State<DetailsAboutAnimals> createState() => _DetailsAboutAnimalsState();
}

class _DetailsAboutAnimalsState extends State<DetailsAboutAnimals> {
  final TextEditingController habitatController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController habitatController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController habitatController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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

  Widget buildBigContainerDetails(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextOptinal("Type of animal"),
            buildTextFormField(widget.predator.name, type),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Type"),
            buildTextFormField(widget.predator.type),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Habitat"),
            buildTextFormField("text"),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Food"),
            buildTextFormField("text"),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Description"),
            buildTextFormField("text"),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
