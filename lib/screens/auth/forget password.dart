import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/widgets/Auth%20btn.dart';
import 'package:vixor_project/componenet/widgets/back%20widget.dart';
import 'package:vixor_project/componenet/widgets/text_widget.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/const/uttils.dart';
import 'package:vixor_project/screens/auth/loading%20manager.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}
class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTextController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }
  void forgetPassFCT() async {
    if (emailTextController.text.isEmpty ||
        !emailTextController.text.contains("@")) {
      errorDialog(
          subtitle: "11".tr, context: context);
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.sendPasswordResetEmail(
            email: emailTextController.text.toLowerCase());
        Fluttertoast.showToast(
          msg: "12".tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.brown.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } on FirebaseException catch (error) {
        errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: LoadingManager(
        isLoading: _isLoading,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1,),
                  const Backwidget(),
                  const SizedBox(height: 20,),
                  Textwidget(
                    text: "13".tr,
                    color: Colors.black,
                    textsize: 30,
                  ),
                  const SizedBox(height: 30,),
                  TextField(
                    controller: emailTextController,
                    style: const TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      hintText: "14".tr,
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  AuthButton(
                    buttonText: "15".tr,
                    fct: () {
                      forgetPassFCT();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
