import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/animal/animal_add_page.dart';
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
                child: Consumer<EcosystemProvider>(
                  builder: (context, provider, child) {
                    final ecosystemItems = provider.ecosystems;
                    return ecosystemItems.isEmpty
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
                        : buildGrid(context, provider, ecosystemItems);
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
                    if (result != null && result is Ecosystem) {
                      Provider.of<EcosystemProvider>(context, listen: false)
                          .addEcosystem(result);
                    }
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

  Widget buildGrid(BuildContext context, EcosystemProvider provider,
      List<Ecosystem> ecosystemanimals) {
    final height = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
      ),
      itemCount: ecosystemanimals.length,
      itemBuilder: (context, index) {
        // Retrieve the first animal from the ecosystem's animals list
        final animal = ecosystemanimals[index].animals;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailsAddPage(
                  ecosystem: ecosystemanimals[index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/nature.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: height * 0.04,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        animal != null ? animal.name : "No Animal",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
