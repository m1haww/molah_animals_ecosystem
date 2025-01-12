import 'package:flutter/material.dart';

class ContainerCheck extends StatelessWidget {
  final String text;
  final bool
      isSelected; // This property tells whether the container is selected or not
  final VoidCallback
      onTap; // This callback is called when the container is tapped

  const ContainerCheck({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap, // Trigger the parent's onTap callback
      child: Container(
        height: height * 0.06,
        width: double.infinity,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.red : Colors.transparent,
                image: !isSelected
                    ? const DecorationImage(
                        image: AssetImage("images/Status Icon Container.png"),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 17,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
