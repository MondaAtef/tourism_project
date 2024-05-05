import 'package:flutter/material.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/ItemList2.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

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
          Image.asset(
            Assets.imagesLang,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              decoration:
                  BoxDecoration(color: AppColors.white.withOpacity(0.7))),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(children: [
              SizedBox(height: 15),
              //ItemList1(),
              SizedBox(height: 50),
              ItemList2(),

              Row(
                children: [
                  //HomeItem3(),
                  //  HomeItem3(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
