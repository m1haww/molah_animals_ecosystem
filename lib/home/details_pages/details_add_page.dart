import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/home/details_pages/details_about_animals.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class DetailsAddPage extends StatefulWidget {
  final Ecosystem ecosystem;

  const DetailsAddPage({super.key, required this.ecosystem});
  @override
  State<DetailsAddPage> createState() => _DetailsAddPageState();
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
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailsAboutAnimals(
                                  predator: widget.ecosystem.predator!),
                            ));
                      },
                      child: buildDetailsContainer(
                        context,
                        widget.ecosystem.predator!.name,
                      )),
                  ClipOval(
                    child: Image.asset(
                      "images/111.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildDetailsContainer(context, widget.ecosystem.victim!.name)
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
