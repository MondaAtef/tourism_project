// in sign up , login __________

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LinkText({super.key, 
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: GoogleFonts.oxanium(
        textStyle: TextStyle(
          color: Colors.amber, // Customize link text color
          decoration: TextDecoration.underline, // Add underline to text
        ),
        ),
      ),
    );
  }
}
