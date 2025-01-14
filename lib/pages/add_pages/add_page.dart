import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/pages/Home.dart';
import 'package:molah_animals_ecosystem/pages/add_pages/add_predator.dart';
import 'package:molah_animals_ecosystem/pages/add_pages/add_victim.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Ecosystem? ecosystem; //
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

  bool addPredatoravailable = false;
  bool AddVictimavailable = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context, ecosystem);
        }),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText("Create a food value"),
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
                            : const Image(
                                image: AssetImage(
                                    "images/add.png"))) // Fallback for web
                        : Image.file(_selectedImage!))),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextField("Name of the ecosystem",
                controller: titleController),
            SizedBox(
              height: height * 0.02,
            ),
            buildTextField("Description", controller: descriptionController),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (ecosystem?.predator == null)
                  GestureDetector(
                    onTap: () async {
                      final predator = await Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => AddPredator()),
                      );
                      if (predator != null && predator is Predator) {
                        print("vicitm is not null");
                        setState(() {
                          ecosystem?.predator = predator as Predator?;
                        });
                      }
                    },
                    child: buildAddContainer(context, "Add a predator",
                        const Color(0xffE5182B), Colors.white),
                  ),
                SizedBox(height: height * 0.02),
                if (ecosystem?.victim == null)
                  GestureDetector(
                    onTap: () async {
                      final victim = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const AddVictim()),
                      );
                      if (victim != null && victim is Victim) {
                        setState(() {
                          ecosystem?.victim = victim as Victim?;
                        });
                      }
                    },
                    child: buildAddContainer(context, "Add a victim",
                        const Color(0xffABABAB), const Color(0xff585858)),
                  ),
                if (ecosystem?.victim != null && ecosystem?.predator != null)
                  GestureDetector(
                    onTap: () {
                      if (titleController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        Navigator.pop(
                            context,
                            Ecosystem(
                                title: titleController.text,
                                description: descriptionController.text));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please fill in all fields")),
                        );
                      }
                    },
                    child: buildAddContainer(context, "View connection",
                        const Color(0xff4CAF50), Colors.white),
                  ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
