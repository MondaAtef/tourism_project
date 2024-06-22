import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitlesTextWidget extends StatelessWidget {
  const TitlesTextWidget({
    Key? key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.maxLines,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
          fontWeight: FontWeight.w600,
       // overflow: TextOverflow.ellipsis,
      ),
      ),
    );
  }
}
