import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/All%20places.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/add&edit%20place.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

import 'admin_component.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 208, 208),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 400,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 208, 208, 208),
                Color.fromARGB(200, 33, 126, 180),
              ],
              stops: [0.0, 0.5],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.8),
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.pharaon,// Replace with your image path
                    width: 40, // Adjust size as needed
                    height: 40,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      //fontWeight: FontWeight.bold,
                        fontFamily: 'Oxanium',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 220),
              ImageButton(
                text: "55".tr,
                imagePath: Assets.guard,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditOrUploadPlaceScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              ImageButton(
                text: "56".tr,
                imagePath: Assets.guard,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllplacesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
