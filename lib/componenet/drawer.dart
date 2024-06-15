import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/admin_screen.dart';
import 'package:vixor_project/screens/luxor.dart';
import 'package:vixor_project/screens/more_about_sustainability.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var formKey = GlobalKey<FormState>();
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
              )),
              ListTile(
                title: const Text(
                  'More About Sustainability',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sustabilty()),
                  );
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Customize Trip',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'More About luxor',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const luxor()),
                  );
                  // Navigator.pop(context);
                },
              ),


              ListTile(
                title: const Text(
                  'Admin',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(30),
                          child: Material(
                            color: Colors.white.withOpacity(0.9),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.85,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Form(
                                    key: formKey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.6,
                                          height: 50,
                                          child: TextFormField(
                                              controller: emailcontroller,
                                              obscureText: true,
                                              validator: (v) {
                                                if (v.toString() != '123') {
                                                  print("0");
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                prefixIcon:
                                                    const Icon(Icons.lock),
                                                fillColor:
                                                    const Color(0xff8E4F2E),
                                                filled: true,
                                                labelText: 'Lock',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12)),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (value) {
                                                print(value);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () async {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: const Color(0xffecf6ff),
                                        ),
                                        height: 40.0,
                                        width: 250.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  if (emailcontroller.text ==
                                                      '123') {
                                                    navigateTo(
                                                        context, const Admin());
                                                  } else {
                                                    Fluttertoast.showToast(
                                                      msg: "Try Again",
                                                      toastLength:
                                                          Toast.LENGTH_LONG,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.grey.shade600,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );
                                                  }
                                                }
                                              },
                                              child: const Text(
                                                'Enter',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'Oxanium',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
