import 'package:flutter/material.dart';
import 'package:vixor_project/utils/app_imagse.dart'; // Ensure this import is correct

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_key_in_widget_constructors
  const MyAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF8D502F),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      // title: Center(
      // child: Text(
      //   'VIXOR',
      //   style: const TextStyle(

      //     fontSize: 30,
      //     fontWeight: FontWeight.w400,
      //     height: 0.8,
      //     color: Color(0xffffffff),
      //   ),
      // ),
      title: Center(
        child: Image.asset(
          Assets.appbar2,
          width: 120,
          height: 100,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Image.asset(
            Assets.imagesLogow,
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
