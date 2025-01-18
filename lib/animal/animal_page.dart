import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/animal/animal_add_page.dart';
import 'package:molah_animals_ecosystem/home/Home.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/home/details_pages/details_add_page.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  Widget buildGridanimal(
    BuildContext context,
  ) {
    final height = MediaQuery.of(context).size.height;
    final counterModel = Provider.of<EcosystemProvider>(context);
    print(
      counterModel.addanimal.length,
    );
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8, // Increased space between items
        mainAxisSpacing: 12, // Increased space between items
      ),
      itemCount: counterModel.addanimal.length,
      itemBuilder: (context, index) {
        print(counterModel.addanimal[index].name);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailsAddPage(
                  ecosystem: counterModel.ecosystems[index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18), // Rounded corners
            child: Stack(
              children: [
                // Image with gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        width: 2, color: Colors.white.withOpacity(0.3)),
                    image: const DecorationImage(
                      image: AssetImage("images/nature.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Text overlay on image
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.6), // Dark background for text
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          counterModel.addanimal[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          counterModel.addanimal[index].birth,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          counterModel.addanimal[index].type,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
