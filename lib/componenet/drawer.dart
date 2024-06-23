import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/screens/luxor.dart';
import 'package:vixor_project/screens/more_about_sustainability.dart';
import 'package:vixor_project/utils/app_imagse.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vixor_project/screens/localization/localization.dart';


class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  _launchURLInBrowser() async {
    const url = 'https://www.facebook.com/groups/496278322877578/?ref=share';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesWall1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
              ),
              ListTile(
                title:  Text(
                  "80".tr,
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sustabilty()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  '81'.tr,
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const luxor()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  '50'.tr,
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: _launchURLInBrowser,
              ),
              ListTile(
                title:  Text(
                  '82'.tr,
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingBar.builder(
                              initialRating: 2.5,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('82'.tr),
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.pop(context);

                 
                },


              ),
            ],
          ),
        ],
      ),
    );
  }
}
void navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
