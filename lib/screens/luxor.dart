import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/drawer.dart';
import 'package:vixor_project/componenet/my_app_bar.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class luxor extends StatelessWidget {
  const luxor({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const Mydrawer(),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              color: const Color(0xFF8D502F).withOpacity(0.7),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      // height: MediaQuery.sizeOf(context).height * .430,
                      height: 370,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 0,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTextWidget(
                                    text: "Green tips in",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.left,
                                  ),
                                  const CustomTextWidget(
                                    text: "Luxor city",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffC78800),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.0),
                                        topLeft: Radius.zero,
                                        bottomRight: Radius.circular(50.0),
                                        bottomLeft: Radius.zero,
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0),
                                      child: CustomTextWidget(
                                        text: 'Introduction',
                                        fontSize: 29,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: CustomTextWidget(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      text:
                                          "Luxor is a city in southern Egypt that is renowned for its rich history and impressive archaeological sites. Often referred to as",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 15,
                            right: 0,
                            child: SizedBox(
                                //width: MediaQuery.of(context).size.width * .5,
                                child: Image(image: AssetImage(Assets.forest))),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomTextWidget(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        text:
                            "the\"world\'s greatest open-air museum,\" Luxor is built on the site of the ancient city of Thebes, which was the capital of Egypt during the New Kingdom period. ",
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: CustomTextWidget(
                          text: 'Some Warnings',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          text:
                              "-Respect Monuments: Avoid touching or writing on artifacts.\n-Keep Sites Clean: Use designated bins for trash.\n-Follow Guides'Instructions: Obey signage and guides'directions.\n-Camera Etiquette: No flash photography near ancient art.\n-Sustainability: Preserve cultural treasures for future generations",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xffC78800),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: CustomTextWidget(
                          text: 'Sustainable Tourism in Luxor',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          text:
                              "Historical Importance: Luxor, Egypt's ancient capital, is famous for its ancient temples and tombs, attracting visitors worldwide.\nSustainability Goals: Luxor aims to promote sustainable tourism by managing cultural and natural resources wisely and involving the local community.\nFuture Outlook: With these efforts, Luxor plans to remain a popular and sustainable tourist destination while preserving its cultural heritage for future generations.",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
