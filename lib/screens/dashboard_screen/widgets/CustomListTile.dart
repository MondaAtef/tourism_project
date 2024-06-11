import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.function,
    this.textColor = Colors.white,
    // Add this line with default value
  }) : super(key: key);

  final String imagePath, text;
  final Function function;
  final Color textColor; // Add this line

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },

      title: SubtitleTextWidget(
        label: text,
        color: textColor,
      ),

      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
