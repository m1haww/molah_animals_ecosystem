import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/home/Home.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
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
      setState(() {
        if (kIsWeb) {
          pickedImage.readAsBytes().then((bytes) {
            setState(() => _imageData = bytes);
          }).catchError((e) => print("Error loading image data: $e"));
        } else {
          _selectedImage = File(pickedImage.path);
        }
      });
    }
  }

  void _showSnackBar(String message) {
    // Show a SnackBar with the provided message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xffE5182B),
        content: Text(
          message,
          style: TextStyle(fontFamily: "Sf", color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<EcosystemProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText("Profile"),
                SizedBox(height: height * 0.04),
                GestureDetector(
                  onTap: () {
                    // Show SnackBar when the profile image is clicked
                    _showSnackBar("You should change it in Edit Profile");
                  },
                  child: counterModel.profile == null
                      ? ClipOval(
                          child: Image(
                              image: const AssetImage("images/add.png"),
                              width: width * 0.30,
                              height: width * 0.30,
                              fit: BoxFit.cover))
                      : buildAvatar(context, counterModel.profile!.image),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Text(
                      counterModel.profile?.name ?? "Name",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      counterModel.profile?.surname ?? "Surname",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                buildEditButon(context),
                SizedBox(height: height * 0.02),
                const Text(
                  "My ecosystems",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: height * 0.02),
                if (counterModel.ecosystems.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No items added yet.",
                          style: TextStyle(
                              fontFamily: "Sf", fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: height * 0.02),
                if (counterModel.ecosystems.isNotEmpty)
                  SizedBox(height: height * 0.17, child: buildGrid(context)),
                SizedBox(height: height * 0.04),
                const Text(
                  "My animals",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w500),
                ),
                if (counterModel.addanimal.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No animals added yet.",
                          style: TextStyle(
                              fontFamily: "Sf", fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                if (counterModel.addanimal.isNotEmpty)
                  SizedBox(
                      height: height * 0.17, child: buildGridanimal(context)),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
