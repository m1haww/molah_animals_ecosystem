import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/pages/add_victim.dart';

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

Widget buildIconBack(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE5182B),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            "Back",
            style: TextStyle(color: Color(0xffE5182B), fontSize: 17),
          ),
        ],
      ),
    ),
  );
}

Widget buildNextbuton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: const Text(
      "Next",
      style: TextStyle(color: Color(0xffE5182B), fontSize: 17),
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
      style: const TextStyle(color: Colors.black),
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
    style: const TextStyle(fontSize: 15, color: Color(0xff585858)),
  );
}
