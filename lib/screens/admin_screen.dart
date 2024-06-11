import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/All%20places.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/add&edit%20place.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:get/get.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   Assets.imagesLang,
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          Container(decoration: const BoxDecoration(color: AppColors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(children: [
              const SizedBox(height: 15),
              //ItemList1(),

              Button(
                  text: "55".tr,
                  //TextStyle:Colors.white,
                  color: const Color(0xff8E4F2E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EditOrUploadPlaceScreen()),
                    );
                  }),
              const SizedBox(height: 50),

              Button(
                  text: "56".tr,
                  // TextStyle:Colors.white,
                  color: const Color(0xff8E4F2E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllplacesScreen()),
                    );
                  }),
              // ItemList2(),

              // Row(
              //   children: [
              //     //HomeItem3(),
              //     //  HomeItem3(),
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
