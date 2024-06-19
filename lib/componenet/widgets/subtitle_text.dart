import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    Key? key,
    required this.label,
    this.fontSize = 18,
    this.fontStyle = FontStyle.normal,
    this.fontWeight,
    this.color,
    this.textDecoration = TextDecoration.none,
  }) : fontFamily = "Oxanium";

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
        style: GoogleFonts.oxanium(
        textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        color: color,
        fontStyle: fontStyle,
         // Use fontFamily parameter
      ),
        ),
    );
  }
}
