import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({
    super.key,
  });
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool _saveProfile = false;
  @override
  void initState() {
    super.initState();
    // Add listeners to controllers to update save button state
    nameController.addListener(_updateSaveButtonState);
    surnameController.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    // Dispose controllers and listeners
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _saveProfile =
          nameController.text.isNotEmpty && surnameController.text.isNotEmpty;
    });
  }

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
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context);
        }),
        actions: [
          GestureDetector(
              onTap: _saveProfile
                  ? () {
                      final counterModel = Provider.of<EcosystemProvider>(
                          context,
                          listen: false);
                      final imageToSave = kIsWeb ? _imageData : _selectedImage;
                      counterModel.addProfile(Profile(
                        name: nameController.text,
                        surname: surnameController.text,
                        image: kIsWeb
                            ? MemoryImage(_imageData!)
                            : FileImage(_selectedImage!),
                      ));
                      Navigator.pop(context);
                    }
                  : null,
              child: buildNextbuton("Save"))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText("Profile"),
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
                          : const Image(image: AssetImage("images/add.png")))
                      : Image.file(_selectedImage!)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextField("Name", controller: nameController),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextField("Surname", controller: surnameController),
          ],
        ),
      )),
    );
  }
}
