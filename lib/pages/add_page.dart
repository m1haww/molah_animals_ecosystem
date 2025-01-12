import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/main.dart';
import 'package:molah_animals_ecosystem/models/container.dart';
import 'package:molah_animals_ecosystem/pages/Home.dart';
import 'package:molah_animals_ecosystem/pages/add_predator.dart';
import 'package:molah_animals_ecosystem/pages/add_saved_page.dart';
import 'package:molah_animals_ecosystem/pages/add_victim.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context),
        actions: [
          GestureDetector(
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Home(
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill in all fields")),
                  );
                }
              },
              child: buildNextbuton(context))
        ],
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
            const Image(image: AssetImage("images/add.png")),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Home(
                            title: titleController.text,
                            description: "",
                          ),
                        ));
                  },
                  child: buildAddContainer(context, "Add a predator",
                      const Color(0xffE5182B), Colors.white),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Home(
                            title: "",
                            description: '',
                          ),
                        ));
                  },
                  child: buildAddContainer(context, "Add a victim",
                      const Color(0xffABABAB), const Color(0xff585858)),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
