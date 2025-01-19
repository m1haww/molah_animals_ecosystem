import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class DetailsAnimalPage extends StatefulWidget {
  final AddAnimal addAnimal;

  const DetailsAnimalPage({super.key, required this.addAnimal});

  @override
  State<DetailsAnimalPage> createState() => _DetailsAnimalPageState();
}

class _DetailsAnimalPageState extends State<DetailsAnimalPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(widget.addAnimal.name),
                SizedBox(
                  height: height * 0.02,
                ),
                buildAvatar(context, widget.addAnimal.image),
                SizedBox(
                  height: height * 0.02,
                ),
                buildBigContainerDetails(context),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
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
            buildContainerdetailsAnimals(widget.addAnimal.type),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Type"),
            buildContainerdetailsAnimals(widget.addAnimal.optional),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextOptinal("Habitat"),
            buildContainerdetailsAnimals(widget.addAnimal.birth),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

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
