import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String imagePath;

  const ImageButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40), // Adjust as needed
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 250,
              height: 100, // Set the height as needed
            ),
          ),
          Container(
            width: 250,
            height: 100, // Same height as the image
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(100, 0, 0, 0),
                  Color.fromARGB(100, 0, 0, 0),
                ],
                stops: [0.0, 0.5],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
