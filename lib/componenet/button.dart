import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fixedSize: Size(200, 50),
          backgroundColor: color.withOpacity(0.8),
        ),
        child: Text(
          text,
          style: GoogleFonts.oxanium(
            textStyle: TextStyle(
              color: Color.fromARGB(167, 33, 126, 180),
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
