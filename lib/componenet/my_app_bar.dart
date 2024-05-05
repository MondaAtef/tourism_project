import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vixor_project/componenet/drawer.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/admin_screen.dart';
import 'package:vixor_project/screens/luxor.dart';
import 'package:vixor_project/screens/more_about_sustainability.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_key_in_widget_constructors
  const Myappbar({Key? key});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,

      title:  Center(
        child: Image.asset(Assets.vixor,
        width: 100,
        height:90,
        )

   

        // Text(
        //   'Vixor',
        //   style: TextStyle(
        //       fontSize: 30,
        //       fontWeight: FontWeight.w400,
        //       height: 0.8,
        //       color: Color(0xffffffff)),
        //       //color: Color(0xff8E4F2E)),
        // ),
      ),
      actions:  [
        Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: Image.asset(Assets.imagesLogo,
            width: 60,
            height:50,)),


      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
