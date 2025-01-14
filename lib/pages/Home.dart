import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/pages/add_pages/add_page.dart';
import 'package:molah_animals_ecosystem/pages/details_pages/details_add_page.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ecosystem> ecosystemItems = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Home"),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ecosystemItems.isEmpty
                    ? const Center(
                        child: Text(
                          "No items added yet.",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : buildGrid(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AddPage(),
                      ),
                    );
                    if (result != null && result is Ecosystem) {
                      setState(() {
                        ecosystemItems.add(result); // Add new item to list
                      });
                    }
                  },
                  child: const Image(
                    image: AssetImage("images/Button.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid() {
    final height = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
      ),
      itemCount: ecosystemItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetailsAddPage(
                    ecosystem: ecosystemItems[index],
                  ),
                ));
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
                        ecosystemItems[index].title,
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

  Widget buildText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
