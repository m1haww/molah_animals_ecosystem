import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';
import 'package:molah_animals_ecosystem/profile/profile_edit_page.dart';
import 'package:table_calendar/table_calendar.dart';

Widget buildContainer(BuildContext context, VoidCallback onTap) {
  final height = MediaQuery.of(context).size.height;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffE5182B),
      ),
      child: const Center(
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget buildText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
  );
}

Widget buildIconBack(BuildContext context, VoidCallback onTap) {
  final height = MediaQuery.of(context).size.height;
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE5182B),
          ),
        ],
      ),
    ),
  );
}

Widget buildNextbuton(String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: Text(
      text,
      style: const TextStyle(color: Color(0xffE5182B), fontSize: 17),
    ),
  );
}

Widget buildTextField(String labelText,
    {required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: controller,
      maxLines: null,
      minLines: 1,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0XFFABABAB), fontSize: 13),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: InputBorder.none,
      ),
    ),
  );
}

Widget buildAddContainer(
    BuildContext context, String text, Color color, Color textColor) {
  final height = MediaQuery.of(context).size.height;

  return GestureDetector(
    child: Container(
      height: height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget buildTextOptinal(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 15, color: Color(0xffABABAB)),
  );
}

Widget buildTextOptinal2(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 15, color: Color(0xff585858)),
  );
}

Widget buildTextFormField(String hintText, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(),
    ),
    style: const TextStyle(fontSize: 17, color: Colors.black),
  );
}

Widget buildDetailsContainer(
  BuildContext context,
  final String name,
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
          child: Image.asset(
            "images/nature.jpeg",
            width: width * 0.25,
            height: width * 0.25,
            fit: BoxFit.cover,
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

Widget buildImage(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return ClipOval(
    child: Image.asset(
      "images/nature.jpeg",
      width: width * 0.45,
      height: width * 0.45,
      fit: BoxFit.cover,
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
          buildTextOptinal("Type of animal"),
          buildTextforme("text"),
          SizedBox(
            height: height * 0.02,
          ),
          buildTextOptinal("Type"),
          buildTextforme("text"),
          SizedBox(
            height: height * 0.02,
          ),
          buildTextOptinal("Habitat"),
          buildTextforme("text"),
          SizedBox(
            height: height * 0.02,
          ),
          buildTextOptinal("Food"),
          buildTextforme("text"),
          SizedBox(
            height: height * 0.02,
          ),
          buildTextOptinal("Description"),
          buildTextforme("text"),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    ),
  );
}

Widget buildContainerOpen(BuildContext context, final String text,
    void Function(DateTime selectedDate) handleDateSelection) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.075,
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
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
          GestureDetector(
            onTap: () async {
              // Show the calendar in a bottom sheet
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  DateTime selectedDate =
                      DateTime.now(); // Initialize selectedDate

                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TableCalendar(
                              firstDay: DateTime.utc(2020, 1, 1),
                              lastDay: DateTime.utc(2030, 12, 31),
                              focusedDay: DateTime.now(),
                              calendarFormat: CalendarFormat.month,
                              selectedDayPredicate: (day) {
                                // Highlight the selected day
                                return isSameDay(day, selectedDate);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  selectedDate = selectedDay;
                                });
                              },
                              calendarStyle: const CalendarStyle(
                                todayDecoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 78, 69),
                                  shape: BoxShape.circle,
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: Color(0xffFF3B30),
                                  shape: BoxShape.circle,
                                ),
                                selectedTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                todayTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                outsideTextStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                leftChevronIcon: Icon(Icons.arrow_left,
                                    color: Color(0xffFF3B30)),
                                rightChevronIcon: Icon(Icons.arrow_right,
                                    color: Color(0xffFF3B30)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ),
  );
}

Widget buildEditButon(BuildContext context) {
  final height = MediaQuery.of(context).size.height;

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const ProfileEditPage(),
          ));
    },
    child: Container(
      height: height * 0.08,
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
      child: const Padding(
        padding: EdgeInsets.only(right: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
