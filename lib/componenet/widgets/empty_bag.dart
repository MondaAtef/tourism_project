import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';

import 'subtitle_text.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/HomeScreen.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.buttonText,
  });

  final String imagePath, title, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          const SizedBox(
            height: 20,
          ),
           TitlesTextWidget(
            label:'61'.tr,
            fontSize: 40,
            color: const Color(0xff9f6b4f),
          ),
          const SizedBox(
            height: 20,
          ),
          SubtitleTextWidget(
            label: title,
            fontWeight: FontWeight.w600,
          ),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff9f6b4f),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            onPressed: () {
              // Navigate to the Homescreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homescreen()),
              );
            },
            child: Text(buttonText,style: const TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}