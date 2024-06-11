import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    Key? key,
    required this.label,
    this.fontSize = 18,
    this.fontStyle = FontStyle.normal,
    this.fontWeight,
    this.color,
    this.textDecoration = TextDecoration.none,
  }) : fontFamily = "Oxanium"; // Set default fontFamily to "Oxanium"

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  final String fontFamily; // Added fontFamily parameter

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        color: color,
        fontStyle: fontStyle,
        fontFamily: fontFamily, // Use fontFamily parameter
      ),
    );
  }
}
