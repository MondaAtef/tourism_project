
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/drawer.dart';
import 'package:vixor_project/componenet/my_app_bar.dart';
import 'package:vixor_project/screens/album_screen/album_screen.dart';
import 'package:vixor_project/screens/chat_screen/chat_screen.dart';
import 'package:vixor_project/screens/dashboard_screen/dashbord.dart';
import 'package:vixor_project/screens/map_screen/map_screen.dart';
import 'package:vixor_project/screens/profile_screen/profile_screen.dart';

import '../../../utils/app_imagse.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  Color iconColor = const Color(0xff8E4F2E);
  int _index = 0;

  List screens =  [
    const DashBoardScreen(),
    const MapScreen(),
    const Photobook(),
    const ChatScreen(),
    SettingScreen(),
  ];

  void onTap(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Myappbar(),
      drawer: const Mydrawer(),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: onTap,
          iconSize: 35,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(Assets.home,
                  width: 35,
                  height:35,
                  color: const Color(0xff8E4F2E)

              ),
            ),
             BottomNavigationBarItem(
              label: '',
              icon: Image.asset(Assets.map,
                  width: 35,
                  height:40,
                  color: const Color(0xff8E4F2E)

              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(Assets.gallery,
                  width: 35,
                  height:35,
                  color: const Color(0xff8E4F2E)

              ),
            ),
             BottomNavigationBarItem(
              label: '',
              icon: Image.asset(Assets.chatbot,
                width: 40,
                height:45,
                  color: const Color(0xff8E4F2E)

              ),
            ),
             BottomNavigationBarItem(
              label: '',
              icon: Image.asset(Assets.profile,
                  width: 35,
                  height:40,
                  color: const Color(0xff8E4F2E)

              ),
            ),
          ]),
    );
  }
}
