import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/HomeScreen.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/Trip/Trip_Screen.dart';
import 'package:vixor_project/utils/app_imagse.dart';
import 'package:vixor_project/screens/recommendation_trip/RecommendationScreen.dart';

class ItemList1 extends StatelessWidget {
  const ItemList1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    navigateTo(context, const Homescreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              Assets.imagesTrip,
                              fit: BoxFit
                                  .cover, // Ensure the image fills the container
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(100, 0, 0, 0),
                                Color.fromARGB(100, 0, 0, 0),
                              ],
                              stops: [0.0, 0.5],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Center(
                            child: CustomTextWidget(
                              text: "54".tr,
                              fontSize: 20.0,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),



              SizedBox(
              width: 15,
            ),


         //button Show your trip
             Expanded(
                 flex: 1,
                 child: GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => RecommendationScreen()),
                       );
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40),
                       ),
                       child: Stack(
                         children: [
                           Positioned.fill(
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(40),
                               child: Image.asset(
                                 Assets.imagesWall1,
                                 fit: BoxFit
                                     .cover, // Ensure the image fills the container
                               ),
                             ),
                           ),
                           const SizedBox(
                             width: 15,
                           ),
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(40),
                               gradient: const LinearGradient(
                                 colors: [
                                   Color.fromARGB(100, 0, 0, 0),
                                   Color.fromARGB(100, 0, 0, 0),
                                 ],
                                 stops: [0.0, 0.5],
                                 begin: Alignment.bottomCenter,
                                 end: Alignment.topCenter,
                               ),
                             ),
                             child: Center(
                               child: CustomTextWidget(
                                 text: "53".tr,
                                 textAlign: TextAlign.center,
                                 fontSize: 19.0,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ))),
          ],
        ),
      ),
    );
  }
}
