import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';

import '../../utils/app_imagse.dart';
class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.vixor,
      width: 120,
      height: 90,
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