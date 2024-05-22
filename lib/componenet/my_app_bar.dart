import 'package:flutter/material.dart';
import 'package:vixor_project/utils/app_imagse.dart'; // Ensure this import is correct

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF8D502F), // Set the background color here
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Center(
        child: Text(
          'Vixor',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            height: 0.8,
            color: Color(0xffffffff),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Image.asset(
            Assets.imagesLogo,
            width: 60,
            height: 50,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
