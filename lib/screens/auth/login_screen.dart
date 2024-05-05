

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/imagebutton.dart';
import 'package:vixor_project/componenet/link_text.dart';
import 'package:vixor_project/componenet/padge.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/functions.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/bottom_nav_bar.dart';
import 'package:vixor_project/screens/auth/forget%20password.dart';
import 'package:vixor_project/screens/auth/sign_up_screen.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Future<User?> _googleSignUp({required BuildContext context}) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      final String? name = user?.displayName ;
      final String? image = user?.photoURL ;
      final String? email = user?.email ;
      final String? uid = user?.uid ;
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        'id': uid,
        'name':name,
        'image': image,
        'email': email,
        'createdAt': Timestamp.now(),
        'phone':'01030659884',
        'bio':'write your bio...',
      });
      return user;
    } catch (e) {
      print(e.toString());
    }
  }  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
  bool _isLoading = false;
  void submitFormOnLogin() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.signInWithEmailAndPassword(
            email:emailTextController.text.toLowerCase().trim() ,
            password:passTextController.text.trim());
        navigateTo(context, const CustomBottomNavBar());
        print('59'.tr);
      }
      on FirebaseException catch(error)
      {
        errorDialog(
          subtitle:'${error.message}' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      } catch(error)
      {
        errorDialog(
          subtitle:'$error' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      }finally{
        setState(() {
          _isLoading=false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padge(),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextWidget(
                  text: "7".tr,
                  color: const Color(0xff8E4F2E),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                           "2".tr,
                          style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        )),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete:()=>FocusScope.of(context).requestFocus(passFocusNode),
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return "19".tr;
                        }else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "3".tr,
                        //labelText: 'Enter Email Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 3, color: AppColors.brown),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(6),
                        child: CustomTextWidget(
                          text: "4".tr,
                          //text: 'Password',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      onEditingComplete:(){
                        submitFormOnLogin();
                      },
                      controller: passTextController,
                      focusNode: passFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText,
                      validator: (value){
                        if(value!.isEmpty || value.length<7){
                          return "20".tr;
                        }else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "5".tr,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 3, color: AppColors.brown),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                          child: Icon(
                            obscureText?
                            Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: LinkText(
                    text: "6".tr,
                    onPressed: () {
                      navigateTo(context,const ForgetPasswordScreen());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
             GestureDetector(
               child:  Button(
                  text: "7".tr,
                 //  TextStyle:Colors.white,
                  color: AppColors.primaryColor,
                  onPressed: () {
                    submitFormOnLogin();
                  }),
             ),
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: CustomTextWidget(
                      text: "8".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 95),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ImageButton(
                        imagePath: Assets.imagesFacebook,
                        onPressed: () {
                          signInWithFacebook();
                        },
                        width: 150,
                        height: 50,
                        borderRadius: 15,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 5,
                        )),
                    Expanded(
                      flex: 1,
                      child: ImageButton(
                        imagePath: Assets.imagesGmailLogo,
                      onPressed: ()async {

                          await  _googleSignUp(context: context).
                          then((value) {
                            navigateTo(context,CustomBottomNavBar());

                        //  await  _googleSignUp(context).then((value) {
                         //   navigateTo(context,const CustomBottomNavBar());

                          });
                        },
                        width: 150,
                        height: 50,
                        borderRadius: 15,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CustomTextWidget(
                      text: "9".tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    LinkText(
                      text: "10".tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
