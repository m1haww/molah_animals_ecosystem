import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image selection
import 'package:molah_animals_ecosystem/models/important_models/container.dart'; // Assuming buildContainerOpen and other imports are correct

class AnimalAddPage extends StatefulWidget {
  const AnimalAddPage({super.key});

  @override
  State<AnimalAddPage> createState() => _AnimalAddPageState();
}

class _AnimalAddPageState extends State<AnimalAddPage> {
  final TextEditingController name_of_the_animalController =
      TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController optionalController = TextEditingController();

  DateTime? _selectedDateOfBirth;

  File? _selectedImage; // For mobile
  Uint8List? _imageData; // For web
  final ImagePicker _picker = ImagePicker();

  // Function to handle the selected date from the bottom sheet
  void _handleDateSelection(DateTime selectedDate) {
    setState(() {
      _selectedDateOfBirth = selectedDate; // Save the selected date
    });
  }

  // Function to pick image
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

  // For next button
  void _handleNextButton() {
    if (name_of_the_animalController.text.isEmpty ||
        typeController.text.isEmpty ||
        optionalController.text.isEmpty ||
        _selectedDateOfBirth == null) {
      // Show an error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // Create an object or a map to pass back all the data
    final animalData = {
      'name': name_of_the_animalController.text,
      'breed': typeController.text,
      'optional': optionalController.text,
      'dob': _selectedDateOfBirth,
      'image': _selectedImage, // Add image data
    };

    // Pop the current page and pass the data back to AnimalsPage
    Navigator.pop(context, animalData);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context);
        }),
        actions: [
          GestureDetector(
              child: buildNextbuton("Next"), onTap: _handleNextButton)
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Add animal"),

              SizedBox(
                height: height * 0.04,
              ),
              GestureDetector(
                  onTap: _pickImage,
                  child: _selectedImage == null
                      ? const Image(image: AssetImage("images/add.png"))
                      : (kIsWeb
                          ? (_imageData != null
                              ? Image.memory(_imageData!)
                              : const Image(
                                  image: AssetImage("images/add.png")))
                          : Image.file(_selectedImage!))),
              SizedBox(
                height: height * 0.04,
              ),
              buildTextField("The name of the animal ",
                  controller: name_of_the_animalController),
              SizedBox(
                height: height * 0.02,
              ),
              buildTextField("The breed of the animal (optional) ",
                  controller: typeController),
              SizedBox(
                height: height * 0.02,
              ),
              buildTextField("The name of the animal ",
                  controller: optionalController),
              SizedBox(
                height: height * 0.02,
              ),
              buildContainerOpen(
                context,
                "Date of birth",
                _handleDateSelection, // Pass the callback to handle date selection
              ),
              // Optionally, display the selected date
              if (_selectedDateOfBirth != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:
                      Text("Selected Date: ${_selectedDateOfBirth!.toLocal()}"),
                ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
