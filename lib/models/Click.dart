import 'package:flutter/material.dart';

class Click extends StatefulWidget {
  final String text;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const Click({
    super.key,
    required this.text,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _ClickState createState() => _ClickState();
}

class _ClickState extends State<Click> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: height * 0.2,
        width: width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isSelected
                ? Colors.red
                : Colors.transparent, // Highlight border
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Image.asset(widget.image),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isSelected ? Colors.red : Colors.transparent,
                  image: !widget.isSelected
                      ? const DecorationImage(
                          image: AssetImage("images/Status Icon Container.png"),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: widget.isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      )
                    : null,
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
