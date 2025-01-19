import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class EventsDetailsPage extends StatefulWidget {
  final EventsAnimal eventsanimal;

  const EventsDetailsPage({super.key, required this.eventsanimal});

  @override
  State<EventsDetailsPage> createState() => _EventsDetailsPageState();
}

class _EventsDetailsPageState extends State<EventsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context);
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Visit to the veterinarian"),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                widget.eventsanimal.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: _getEventTypeColor(widget.eventsanimal.type),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.eventsanimal.type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              buildBigContainerDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBigContainerDetails(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextOptional("Date"),
            buildContainerDetailsAnimals(widget.eventsanimal.date),
            SizedBox(height: height * 0.02),
            buildTextOptional("Description"),
            buildContainerDetailsAnimals(widget.eventsanimal.description),
          ],
        ),
      ),
    );
  }

  Color _getEventTypeColor(String type) {
    final colorMap = {
      "Strong": Colors.red,
      "Medium": Colors.orange,
      "Weak": Colors.green,
    };
    return colorMap[type] ?? Colors.grey;
  }

  Widget buildTextOptional(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
  }

  Widget buildContainerDetailsAnimals(String detail) {
    return Text(
      detail,
      style: const TextStyle(fontSize: 14),
    );
  }
}
