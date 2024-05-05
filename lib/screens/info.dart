

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/screens/auth/login_screen.dart';
import 'package:vixor_project/screens/auth/sign_up_screen.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.enter),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            color: Colors.white.withOpacity(0.7),
            child: Container(
              margin: const EdgeInsets.fromLTRB(41, 198, 50, 206),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const AspectRatio(
                      aspectRatio: 6 / 2,
                      child: Image(
                        image: AssetImage(Assets.imagesLogo),
                        width:20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 34),
                      child: const CustomTextWidget(
                        text: 'vixor',
                        color: AppColors.primaryColor,
                        fontSize: 50,
                      ),
                    ),
                    Button(
                        text: "7".tr,
                       // TextStyle:Colors.white,
                        color: const Color(0xff8E4F2E),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        }),
                    Button(
                        text: "47".tr,
                        //TextStyle:Colors.brown,
                        color: const Color(0xffffffff),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
