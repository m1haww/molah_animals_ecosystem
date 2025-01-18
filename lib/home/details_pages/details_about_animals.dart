import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class DetailsAboutAnimals extends StatefulWidget {
  final Predator predator;

  const DetailsAboutAnimals({super.key, required this.predator});

  @override
  State<DetailsAboutAnimals> createState() => _DetailsAboutAnimalsState();
}

class _DetailsAboutAnimalsState extends State<DetailsAboutAnimals> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [buildNextbuton("Edit")],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(widget.predator.name),
              SizedBox(
                height: height * 0.02,
              ),
              buildImage(context),
              SizedBox(
                height: height * 0.02,
              ),
              buildBigContainerDetails(context),
            ],
          ),
        ),
      ),
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
            buildContainerdetailsAnimals(widget.predator.name),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Type"),
            buildContainerdetailsAnimals(widget.predator.type),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Habitat"),
            buildContainerdetailsAnimals(widget.predator.habitat),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Food"),
            buildContainerdetailsAnimals(widget.predator.food),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Description"),
            buildContainerdetailsAnimals(widget.predator.description),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods for building widgets
  Widget buildText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget buildTextOptinal(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget buildContainerdetailsAnimals(String text) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.grey[300], // Placeholder for an image
      child: const Center(
        child: Icon(
          Icons.image,
          size: 50,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget buildNextbuton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
