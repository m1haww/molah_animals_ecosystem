import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/pages/details_pages/details_about_animals.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class DetailsAddPage extends StatefulWidget {
  // final String title;
  // final String name;
  // final Predator predator;
  // final Victim victim;

  // const DetailsAddPage(
  //     {super.key,
  //     required this.title,
  //     required this.name,
  //     required this.predator,
  //     required this.victim});

  @override
  State<DetailsAddPage> createState() => _DetailsAddPageState();
}

class _DetailsAddPageState extends State<DetailsAddPage> {
  List<Ecosystem> ecosystemItems = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Forest Chain"),
              SizedBox(
                height: height * 0.02,
              ),
              buildImage(context),
              SizedBox(
                height: height * 0.02,
              ),
              buildTextOptinal2("Chain"),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailsAboutAnimals(),
                            ));
                      },
                      child: buildDetailsContainer(context)),
                  ClipOval(
                    child: Image.asset(
                      "images/111.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildDetailsContainer(context)
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
