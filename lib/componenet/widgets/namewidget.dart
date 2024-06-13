import 'package:flutter/material.dart';

import '../../utils/app_imagse.dart';
class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      'vixor',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: "Oxanium",

        // You can add more styling options here
      ),
    );
    // return Shimmer.fromColors(
    //   period: const Duration(seconds: 22),
    //   baseColor: Colors.transparent,
    //   highlightColor: Colors.white,
    //   child: Image.asset(Assets.vixor,
    //   width: 120,
    //   height:90,
    //   )
    //   // TitlesTextWidget(
    //   //   label: "Vixor",
    //   //   fontSize: fontSize,
    //   // ),
    // );
  }
}