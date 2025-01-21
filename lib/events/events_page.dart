import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/events/events_add_page.dart';
import 'package:molah_animals_ecosystem/events/events_details_page.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  // Controllers

  // State for Save Button
  final bool _isSaveEnabled = false;

  Widget buildGridEvents(BuildContext context) {
    final counterModel = Provider.of<EcosystemProvider>(context);
    return ListView.builder(
      itemCount: counterModel.eventsanimal.length,
      itemBuilder: (context, index) {
        final event = counterModel.eventsanimal[index];
        final colorMap = {
          "Strong": Colors.red,
          "Medium": Colors.orange,
          "Weak": Colors.green,
        };
        final color = colorMap[event.type] ?? Colors.grey;

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => EventsDetailsPage(
                      eventsanimal: counterModel.eventsanimal[index]),
                ));
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.date,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
              buildText("Events"),
              SizedBox(height: height * 0.02),
              Expanded(
                child: Consumer<EcosystemProvider>(
                  builder: (context, provider, child) {
                    final ecosystemItems = provider.eventsanimal;
                    return ecosystemItems.isEmpty
                        ? Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image:
                                    const AssetImage("images/any_events.png"),
                                width: width * 0.65,
                                height: height * 0.65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : buildGridEvents(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const EventsAddPage(),
                      ),
                    );
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
