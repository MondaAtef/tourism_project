import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/widgets/dash.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/models/list_item_model.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/home_item_3.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

import 'widgets/home_item_list_1.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<ListItemModel> itemModel = [
    ListItemModel(image: Assets.imagesWall1, text: 'karnak '),
    ListItemModel(image: Assets.imagesWall1, text: 'karnak temple'),
    ListItemModel(image: Assets.imagesWall1, text: 'karnak temple')
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: const BoxDecoration(color: AppColors.white)),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Container(
              //   width: MediaQuery.sizeOf(context).width * 0.7,
              //   height: MediaQuery.sizeOf(context).width * 0.2,
              //   decoration: BoxDecoration(
              //       color: AppColors.blue.withOpacity(0.4),
              //       borderRadius: BorderRadius.circular(16)),
              //   child:  Column(
              //     // crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [

              //       CustomTextWidget(text: '52'.tr, color: Colors.white),
              //       const CustomTextWidget(text: 'user name', color: Colors.white),

              //     ],
              //   ),
              // ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomTextWidget(
                      //textAlign: TextAlign.start,
                      text: '52'.tr,
                      color: Colors.black,
                    ),
                  )),

              const SizedBox(height: 15),
              const ItemList1(),
              const SizedBox(height: 30),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: AppConstants.categoyList.length,
                            itemBuilder: (context, index) {
                              return CategorydashWidget(
                                image: AppConstants.categoyList[index].image,
                                name: AppConstants.categoyList[index].name,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                  height: 20); // Use SizedBox for vertical gaps
                            },
                          ),
                        )),
                    const Row(
                      children: [
                        HomeItem3(),
                      ],
                    ),
                  ],
                ),
              ),

              // const SizedBox(
              //   height: 10,
              // ),
            ]),
          ),
        ),
      ],
    );
  }
}
