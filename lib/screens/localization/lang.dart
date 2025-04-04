import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/info.dart';
import 'package:vixor_project/screens/localization/changelocal.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Lang extends GetView<LocaleController> {
  const Lang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            color: const Color(0xFF8D502F).withOpacity(0.8), // Overlay color
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
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 3, 34),
                      child: const CustomTextWidget(
                        text: 'VIXOR',
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 84, 0),
                      child: const Text(
                        "Select Language",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 0, 59),
                      padding:  EdgeInsets.fromLTRB(32, 0, 32, 0),
                      width: double.infinity,
                      height: 62,
                      decoration: BoxDecoration(

                         border: Border.all(color: Colors.white),

                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: const Color(0xFF8D502F), // Background color of the dropdown menu
                        value: "English",
                        items: const [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text(
                              'English',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Ar',
                            child: CustomTextWidget(
                              text: 'Arabic',
                              color: Colors.white, // Text color of dropdown items
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ko',
                            child: CustomTextWidget(
                              text: 'Korean',
                              color: Colors.white, // Text color of dropdown items
                            ),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value == 'English') {
                            controller.changeLang("en");
                            navigateTo(context, const Info());
                          } else if (value == 'Ar') {
                            controller.changeLang("ar");
                            navigateTo(context, const Info());
                          } else if (value == 'ko') {
                            controller.changeLang("ko");
                            navigateTo(context, const Info());
                          }
                        },
                        iconEnabledColor: Colors.white, // Dropdown arrow color
                        style: const TextStyle(color: Colors.white), // Text color inside the dropdown
                      ),
                    ),
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
