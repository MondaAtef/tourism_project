import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
        this.controller,
      required this.text,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight});

  final TextEditingController?controller;
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.oxanium(
        textStyle: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight,

        ),
      ),
    );
  }
}
