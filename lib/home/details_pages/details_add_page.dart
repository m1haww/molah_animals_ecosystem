import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/home/details_pages/details_about_animals.dart';
import 'package:molah_animals_ecosystem/home/details_pages/details_page_2.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class DetailsAddPage extends StatefulWidget {
  final Ecosystem ecosystem;
  const DetailsAddPage({super.key, required this.ecosystem});
  @override
  State<DetailsAddPage> createState() => _DetailsAddPageState();
}

Widget buildDetailsContainerVictim(
  BuildContext context,
  final String name,
  ImageProvider image, // Pass the image here
) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
    width: width * 0.35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            width: width * 0.35,
            height: width * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget buildDetailsContainerPredator(
  BuildContext context,
  final String name,
  ImageProvider image,
) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
    width: width * 0.35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            width: width * 0.35,
            height: width * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

class _DetailsAddPageState extends State<DetailsAddPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          // leading: buildIconBack(context),
          ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(widget.ecosystem.title),
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
                        if (widget.ecosystem.predator != null) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailsAboutAnimals(
                                predator: widget.ecosystem.predator!,
                              ),
                            ),
                          );
                        }
                      },
                      child: buildDetailsContainerPredator(
                        context,
                        widget.ecosystem.predator!.name,
                        widget.ecosystem.predator!.image, // Pass image here
                      )),
                  ClipOval(
                    child: Image.asset(
                      "images/111.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (widget.ecosystem.victim != null) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailsPage2(
                                victim: widget.ecosystem.victim!,
                              ),
                            ),
                          );
                        }
                      },
                      child: buildDetailsContainerVictim(
                        context,
                        widget.ecosystem.victim!.name,
                        widget.ecosystem.victim!.image, // Pass image here
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
