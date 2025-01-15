import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/container_check.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';

class EventsAddPage extends StatefulWidget {
  const EventsAddPage({super.key});

  @override
  State<EventsAddPage> createState() => _EventsAddPageState();
}

class _EventsAddPageState extends State<EventsAddPage> {
  DateTime? _selectedDate;

  void _handleDateSelection(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate; // Save the selected date
    });
  }

  int _selectedIndex = -1;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: buildIconBack(context, () {
          Navigator.pop(context);
        }),
        actions: [
          buildNextbuton("Save"),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Title", controller: titleController),
              SizedBox(height: height * 0.02),
              buildContainerOpen(context, "Data", _handleDateSelection),
              SizedBox(height: height * 0.02),
              buildTextField("Description", controller: descriptionController),
              SizedBox(height: height * 0.02),
              buildTextOptinal2("Type"),
              SizedBox(height: height * 0.02),
              ContainerCheck(
                text: "Strong",
                isSelected: _selectedIndex == 0,
                onTap: () {
                  setState(() {
                    _selectedIndex = _selectedIndex == 0 ? -1 : 0;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              ContainerCheck(
                text: "Medium",
                isSelected: _selectedIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedIndex = _selectedIndex == 1 ? -1 : 1;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              ContainerCheck(
                text: "Weak",
                isSelected: _selectedIndex == 2,
                onTap: () {
                  setState(() {
                    _selectedIndex = _selectedIndex == 2 ? -1 : 2;
                  });
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
