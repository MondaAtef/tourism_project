import 'package:flutter/material.dart';

class CircleImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;

  const CircleImageButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 50,
    this.borderColor = const Color(0xffD8DADC),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xffD8DADC),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
