import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/utils/app_colors.dart';

import 'package:vixor_project/utils/app_imagse.dart';

import '../webview.dart';


class HomeItem3 extends StatelessWidget {
  const HomeItem3({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    Assets.imagesPeople,
                    fit: BoxFit.cover, // Ensure the image fills the container
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, Webviewscreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Color.fromARGB(255, 173, 156, 146),
                        //Color.fromARGB(255, 247, 202, 104),
                      ],
                      stops: [0.0, 0.5],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '50'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        wordSpacing: 1,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'koulen',
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
