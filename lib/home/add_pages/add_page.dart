import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/home/details_pages/details_add_page.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/home/add_pages/add_predator.dart';
import 'package:molah_animals_ecosystem/home/add_pages/add_victim.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  bool _isViewConnectionEnabled() {
    return titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        ecosystem?.predator != null &&
        ecosystem?.victim != null;
  }

  Ecosystem? ecosystem; // To store the ecosystem data (predator, victim)
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
    final width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          if (ecosystem != null &&
              ecosystem?.victim != null &&
              ecosystem?.predator != null) {
            final counterModel =
                Provider.of<EcosystemProvider>(context, listen: false);
            counterModel.addEcosystem(ecosystem!);
          }
          Navigator.pop(context);
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
                      ? ClipOval(
                          child: Container(
                              width: width * 0.20,
                              height: height * 0.20,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/nature.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        )
                      : (kIsWeb
                          ? (_imageData != null
                              ? Image.memory(_imageData!)
                              : ClipOval(
                                  child: Container(
                                      width: width * 0.20,
                                      height: height * 0.20,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage("images/nature.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ))
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
                  // Display the "Add Predator" button if predator is not set
                  if (ecosystem == null)
                    GestureDetector(
                      onTap: () {
                        if (titleController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty) {
                          ecosystem = Ecosystem(
                              title: titleController.text,
                              description: descriptionController.text);
                          setState(() {});
                        }
                      },
                      child: buildAddContainer(context, "Save",
                          const Color(0xffE5182B), Colors.white),
                    ),

                  if (ecosystem?.predator == null && ecosystem != null)
                    GestureDetector(
                      onTap: () async {
                        final predator = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddPredator()),
                        );
                        if (predator != null && predator is Predator) {
                          setState(() {
                            ecosystem?.predator = predator; // Set predator
                          });
                        }
                      },
                      child: buildAddContainer(context, "Add a predator",
                          const Color(0xffE5182B), Colors.white),
                    ),
                  SizedBox(height: height * 0.02),

                  // Display the "Add Victim" button if victim is not set
                  if (ecosystem?.victim == null && ecosystem != null)
                    GestureDetector(
                      onTap: () async {
                        final victim = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddVictim()),
                        );
                        if (victim != null && victim is Victim) {
                          setState(() {
                            ecosystem?.victim = victim; // Set victim
                          });
                        }
                      },
                      child: buildAddContainer(context, "Add a victim",
                          const Color(0xffABABAB), const Color(0xff585858)),
                    ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  if (ecosystem != null &&
                      ecosystem?.victim != null &&
                      ecosystem != null)
                    GestureDetector(
                      onTap: _isViewConnectionEnabled()
                          ? () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        DetailsAddPage(ecosystem: ecosystem!),
                                  ));
                            }
                          : null, // Disable if conditions aren't met
                      child: buildAddContainer(context, "View connection",
                          const Color(0xff4CAF50), Colors.white),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
