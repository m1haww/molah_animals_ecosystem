import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/models/Click.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/container_check.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/functions/food_function.dart';

class AddVictim extends StatefulWidget {
  const AddVictim({super.key});

  @override
  State<AddVictim> createState() => _AddVictimState();
}

class _AddVictimState extends State<AddVictim> {
  File? _selectedImage;
  Uint8List? _imageData;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (kIsWeb) {
          pickedImage.readAsBytes().then((bytes) {
            setState(() {
              _imageData = bytes;
            });
          }).catchError((e) {
            print("Error loading image data: $e");
          });
        } else {
          _selectedImage = File(pickedImage.path);
        }
      });
    } else {
      print("No image selected.");
    }
  }

  bool _isFormValidd() {
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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context);
        }),
        actions: [
          GestureDetector(
              onTap: _isFormValidd()
                  ? () {
                      Navigator.pop(
                          context,
                          Victim(
                              name: name_of_the_animalController.text,
                              image: kIsWeb
                                  ? MemoryImage(_imageData!)
                                  : FileImage(_selectedImage!),
                              habitat: habitatController.text,
                              description: descriptionController.text,
                              food: getFoodSelection(_selectedClickIndex),
                              type: getTypeSelection(_selectedIndex)));
                    }
                  : () {
                      // Show a SnackBar if the form is incomplete
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: const Text(
                            "Please complete all required fields.",
                            style: TextStyle(fontFamily: "Sf"),
                          ),
                          backgroundColor: Color(0xffE5182B),
                        ),
                      );
                    },
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
                buildText("Add a victim"),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: _pickImage,
                  child: _selectedImage == null
                      ? const Image(image: AssetImage("images/add.png"))
                      : (kIsWeb
                          ? (_imageData != null
                              ? Image.memory(_imageData!)
                              : ClipOval(
                                  child: Image(
                                      image: const AssetImage("images/add.png"),
                                      width: width * 0.30,
                                      height: width * 0.30,
                                      fit: BoxFit.cover),
                                ))
                          : ClipOval(
                              child: Image.file(_selectedImage!,
                                  width: width * 0.30,
                                  height: width * 0.30,
                                  fit: BoxFit.cover))),
                ),
                SizedBox(height: height * 0.02),
                buildTextOptinal2("Information about the victim"),
                SizedBox(height: height * 0.02),
                buildTextField("Name of the animal",
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
