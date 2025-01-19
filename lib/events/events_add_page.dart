import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:molah_animals_ecosystem/appProvider/appProvider.dart';
import 'package:molah_animals_ecosystem/models/container_check.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/models/functions/food_function.dart';
import 'package:molah_animals_ecosystem/models/important_models/container.dart';
import 'package:provider/provider.dart';

class EventsAddPage extends StatefulWidget {
  const EventsAddPage({super.key});

  @override
  State<EventsAddPage> createState() => _EventsAddPageState();
}

class _EventsAddPageState extends State<EventsAddPage> {
  DateTime? _selectedDate;

  void _handleDateSelection(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  bool _isFormValid() {
    return titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _selectedIndex != -1;
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
          GestureDetector(
            onTap: _isFormValid()
                ? () {
                    final date = _selectedDate != null
                        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                        : 'Not selected';

                    final counterModel =
                        Provider.of<EcosystemProvider>(context, listen: false);

                    counterModel.addEventsAnimal(EventsAnimal(
                      title: titleController.text,
                      date: date,
                      description: descriptionController.text,
                      type: getTypeSelectionEventsAnimal(_selectedIndex),
                    ));

                    Navigator.pop(context);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildNextbuton("Save"),
            ),
          ),
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
                buildTextField("Description",
                    controller: descriptionController),
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
        ),
      ),
    );
  }
}
