import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
