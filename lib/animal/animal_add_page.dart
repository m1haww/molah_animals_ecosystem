import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

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

  AddAnimal? addAnimal;
  DateTime? _selectedDateOfBirth;
  File? _selectedImage;
  Uint8List? _imageData;
  final ImagePicker _picker = ImagePicker();
  bool _isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to controllers to update save button state
    name_of_the_animalController.addListener(_updateSaveButtonState);
    typeController.addListener(_updateSaveButtonState);
    optionalController.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    // Dispose controllers and listeners
    name_of_the_animalController.dispose();
    typeController.dispose();
    optionalController.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSaveEnabled = name_of_the_animalController.text.isNotEmpty &&
          typeController.text.isNotEmpty &&
          optionalController.text.isNotEmpty;
    });
  }

  void _handleDateSelection(DateTime selectedDate) {
    setState(() {
      _selectedDateOfBirth = selectedDate;
      addAnimal?.birth = _selectedDateOfBirth.toString();
    });
  }

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
            onTap: _isSaveEnabled
                ? () {
                    final formattedDate = _selectedDateOfBirth != null
                        ? DateFormat('yyyy-MM-dd').format(_selectedDateOfBirth!)
                        : 'Not selected';

                    final counterModel =
                        Provider.of<EcosystemProvider>(context, listen: false);

                    final imageToSave = kIsWeb ? _imageData : _selectedImage;

                    counterModel.addAddAnimal(AddAnimal(
                      name: name_of_the_animalController.text,
                      image: kIsWeb
                          ? MemoryImage(_imageData!)
                          : FileImage(_selectedImage!),
                      type: typeController.text,
                      optional: optionalController.text,
                      birth: formattedDate,
                    ));

                    Navigator.pop(context);
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
            child: buildNextbuton(
              "Save",
            ),
          )
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
                SizedBox(height: height * 0.04),
                GestureDetector(
                  onTap: _pickImage,
                  child: _selectedImage == null
                      ? ClipOval(
                          child: Image(
                              image: const AssetImage("images/add.png"),
                              width: width * 0.30,
                              height: width * 0.30,
                              fit: BoxFit.cover))
                      : (kIsWeb
                          ? ClipOval(
                              child: (_imageData != null
                                  ? Image.memory(_imageData!,
                                      width: width * 0.30,
                                      height: width * 0.30,
                                      fit: BoxFit.cover)
                                  : ClipOval(
                                      child: Image(
                                          image: AssetImage("images/add.png"),
                                          width: width * 0.30,
                                          height: width * 0.30,
                                          fit: BoxFit.cover),
                                    )),
                            )
                          : ClipOval(
                              child: Image.file(_selectedImage!,
                                  width: width * 0.30,
                                  height: width * 0.30,
                                  fit: BoxFit.cover))),
                ),
                SizedBox(height: height * 0.04),
                buildTextField("The name of the animal ",
                    controller: name_of_the_animalController),
                SizedBox(height: height * 0.02),
                buildTextField("Type of animal", controller: typeController),
                SizedBox(height: height * 0.02),
                buildTextField("The breed of the animal (optional) ",
                    controller: optionalController),
                SizedBox(height: height * 0.02),
                buildContainerOpen(
                  context,
                  "Date of birth",
                  _handleDateSelection,
                ),
                if (_selectedDateOfBirth != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDateOfBirth!)}",
                    ),
                  ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
