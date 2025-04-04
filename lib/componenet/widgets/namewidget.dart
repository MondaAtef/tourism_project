import 'package:flutter/material.dart';

import '../../utils/app_imagse.dart';
class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      'VIXOR',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}