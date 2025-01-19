import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/animal/animal_add_page.dart';
import 'package:molah_animals_ecosystem/animal/details_animal_page.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

Widget buildGridanimal(
  BuildContext context,
) {
  final height = MediaQuery.of(context).size.height;
  final counterModel = Provider.of<EcosystemProvider>(context);

  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of items in a row
      crossAxisSpacing: 8,
      mainAxisSpacing: 12,
      childAspectRatio: 0.7, // Adjust as needed
    ),
    itemCount: counterModel.addanimal.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DetailsAnimalPage(
                addAnimal: counterModel.addanimal[index],
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18), // Rounded corners
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: counterModel.addanimal[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Text Container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(18)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      counterModel.addanimal[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      counterModel.addanimal[index].birth,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      counterModel.addanimal[index].type,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _AnimalsPageState extends State<AnimalsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Animals"),
              SizedBox(height: height * 0.02),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final provider = Provider.of<EcosystemProvider>(context);
                    final AddAnimal = provider.addanimal;
                    return AddAnimal.isEmpty
                        ? Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image:
                                    const AssetImage("images/any_animals.png"),
                                width: width * 0.65,
                                height: height * 0.65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : buildGridanimal(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AnimalAddPage(),
                      ),
                    );
                    setState(() {});
                  },
                  child: const Image(
                    image: AssetImage("images/Button.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
