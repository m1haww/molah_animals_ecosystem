import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/Click.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/container_check.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/functions/food_function.dart';

class AddPredator extends StatefulWidget {
  const AddPredator({super.key});

  @override
  State<AddPredator> createState() => _AddPredatorState();
}

class _AddPredatorState extends State<AddPredator> {
  // Function to check if all required fields are filled
  bool _isFormValid() {
    return name_of_the_animalController.text.isNotEmpty &&
        habitatController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _selectedClickIndex != -1 && // Ensure food is selected
        _selectedIndex != -1; // Ensure type is selected
  }

  int _selectedIndex = -1; // Track the index of the selected ContainerCheck
  int _selectedClickIndex = -1; // Track the index of the selected Click
  final TextEditingController name_of_the_animalController =
      TextEditingController();
  final TextEditingController habitatController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // leading: buildIconBack(context),
        actions: [
          GestureDetector(
              onTap: _isFormValid()
                  ? () {
                      Navigator.pop(
                          context,
                          Predator(
                              name: name_of_the_animalController.text,
                              habitat: habitatController.text,
                              description: descriptionController.text,
                              food: getFoodSelection(_selectedClickIndex),
                              type: getTypeSelection(_selectedIndex)));
                    }
                  : null,
              child: buildNextbuton("Save"))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText("Add a predator "),
                SizedBox(height: height * 0.02),
                const Image(image: AssetImage("images/add.png")),
                SizedBox(height: height * 0.02),
                buildTextOptinal2("Information about the victim"),
                SizedBox(height: height * 0.02),
                buildTextField("Name of the ecosystem",
                    controller: name_of_the_animalController),
                SizedBox(height: height * 0.02),
                buildTextField("Habitat", controller: habitatController),
                SizedBox(height: height * 0.02),
                buildTextField("Description",
                    controller: descriptionController),
                SizedBox(height: height * 0.02),
                buildTextOptinal2("Food (optional)"),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Click(
                      text: 'Plants',
                      image: 'images/Frame 36.png',
                      isSelected: _selectedClickIndex == 0,
                      onTap: () {
                        setState(() {
                          _selectedClickIndex =
                              _selectedClickIndex == 0 ? -1 : 0;
                        });
                      },
                    ),
                    Click(
                      text: "Meat",
                      image: 'images/Frame 3.png',
                      isSelected: _selectedClickIndex == 1,
                      onTap: () {
                        setState(() {
                          _selectedClickIndex =
                              _selectedClickIndex == 1 ? -1 : 1;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                buildTextOptinal2("Type"),
                SizedBox(height: height * 0.02),
                ContainerCheck(
                  text: "Producers",
                  isSelected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = _selectedIndex == 0 ? -1 : 0;
                    });
                  },
                ),
                SizedBox(height: height * 0.02),
                ContainerCheck(
                  text: "Consults",
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = _selectedIndex == 1 ? -1 : 1;
                    });
                  },
                ),
                SizedBox(height: height * 0.02),
                ContainerCheck(
                  text: "Decomposers",
                  isSelected: _selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      _selectedIndex = _selectedIndex == 2 ? -1 : 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
