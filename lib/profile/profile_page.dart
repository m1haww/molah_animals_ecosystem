import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String surname;
  final dynamic image;

  const ProfilePage(
      {super.key, required this.name, required this.surname, this.image});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  File? _selectedImage; // For mobile
  Uint8List? _imageData; // For web
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print("Image picked: ${pickedImage.path}");
      setState(() {
        if (kIsWeb) {
          // For Web, we use Uint8List for Image.memory
          pickedImage.readAsBytes().then((bytes) {
            setState(() {
              _imageData = bytes;
              print("Image data loaded for web: ${_imageData!.length} bytes");
            });
          }).catchError((e) {
            print("Error loading image data: $e");
          });
        } else {
          // For mobile, we use File for Image.file
          _selectedImage = File(pickedImage.path);
          print("Mobile image selected: ${_selectedImage!.path}");
        }
      });
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Profile"),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: _pickImage,
                child: _selectedImage == null
                    ? const Image(image: AssetImage("images/add.png"))
                    : (kIsWeb
                        ? (_imageData != null
                            ? Image.memory(_imageData!)
                            : const Image(image: AssetImage("images/add.png")))
                        : Image.file(_selectedImage!)),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                widget.name,
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              Text(
                widget.surname,
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              buildEditButon(context),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "My Ecosystems",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "My Ecosystems",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
