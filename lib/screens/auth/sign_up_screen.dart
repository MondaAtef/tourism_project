import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/checkbox.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/link_text.dart';
import 'package:vixor_project/componenet/padge.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/bottom_nav_bar.dart';
import 'package:vixor_project/screens/auth/login_screen.dart';
import 'package:vixor_project/screens/t_and_c.dart';

import '../../utils/app_imagse.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  bool _obscureText = true;
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  bool _isLoading = false;
  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.createUserWithEmailAndPassword(
            email:_emailTextController.text.toLowerCase().trim() ,
            password:_passTextController.text.trim());
        final User? user=authInstance.currentUser;
        final _uid=user!.uid;
        user.updateDisplayName(_fullNameController.text);
        user.reload();
        await FirebaseFirestore.instance.collection('users').doc(_uid).set({
          'id':_uid,
          'name':_fullNameController.text,
          'email':_emailTextController.text.toLowerCase(),
          'shopping_address':_addressTextController.text,
          'createdAt':Timestamp.now(),
          'phone':'01284464432',
          'bio':'write your bio...',
          'image':'https://as1.ftcdn.net/v2/jpg/04/28/56/60/1000_F_428566061_Fkqaq0l831DXPM12Ixs9ds3waZWlCXHH.jpg',

        });
        navigateTo(context, const CustomBottomNavBar());
        print('succesfully registered');
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
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(Assets.background),
    fit: BoxFit.cover,
    ),
    gradient: LinearGradient(
            colors: [
            Color.fromARGB(200, 33, 126, 180),
            Color.fromARGB(200, 142, 80, 46),
          ],
            stops: [0.0, 0.5],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
      ),
    ),
    child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
          Color.fromARGB(200, 33, 126, 180),
          Color.fromARGB(200, 142, 80, 46),
          ],
          stops: [0.0, 0.5],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          ),
         ),
    child: SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padge(),
               Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(
                    text: "10".tr,
                    fontSize: 32,
                    color:Colors.white,
                    fontWeight: FontWeight.w700,
                  )
               ),
Form(
  key: _formKey,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: const EdgeInsets.all(10),
          ),
      TextFormField(

        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context)
            .requestFocus(_emailFocusNode),
        controller: _fullNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return "17".tr;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: "16".tr,
          labelStyle: TextStyle(color: Colors.white),

          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(width: 2, color: Colors.white),

          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
       Padding(
          padding: const EdgeInsets.all(10),
          ),
      TextFormField(

        focusNode: _emailFocusNode,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context)
            .requestFocus(_passFocusNode),
        keyboardType: TextInputType.emailAddress,
        controller: _emailTextController,
        validator: (value) {
          if (value!.isEmpty || !value.contains("@")) {
            return "19".tr;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: "2".tr,
          labelStyle: TextStyle(color: Colors.white),

          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(width: 2, color: Colors.white),

          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      Padding(
          padding: const EdgeInsets.all(10),
          ),
      TextFormField(
        focusNode: _passFocusNode,
        obscureText: _obscureText,
        keyboardType: TextInputType.visiblePassword,
        controller: _passTextController,
        validator: (value) {
          if (value!.isEmpty || value.length < 7) {
            return "20".tr;
          } else {
            return null;
          }
        },
        onEditingComplete: () => FocusScope.of(context)
            .requestFocus(_addressFocusNode),
        decoration: InputDecoration(
          labelText: "4".tr,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(width: 3, color: Colors.white),

          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(10),
         ),
      TextFormField(
        focusNode: _addressFocusNode,
        textInputAction: TextInputAction.done,
        onEditingComplete: _submitFormOnRegister,
        controller: _addressTextController,
        validator: (value) {
          if (value!.isEmpty || value.length < 10) {
            return "22".tr;
          } else {
            return null;
          }
        },
        //maxLines: 2,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          labelText: "21".tr,

          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(width: 2, color: Colors.white),
          //  borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),

        ),
      ),
    ],
  ),
),

              const SizedBox(height: 30),
              Row(
                children: [
                  const Checkboxbut(),
                   SizedBox(
                    //width: 150,
                    child: CustomTextWidget(
                      text: "24".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    //width: 150, // Adjust width as needed
                    child: LinkText(
                      text: "25".tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Tc()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // GestureDetector(onTap: _signUp),
              Button(
                  text: "10".tr,

                  color: Color.fromARGB(255, 208, 208, 208),
                  onPressed: () {
                    _submitFormOnRegister();
                  }

                  ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   CustomTextWidget(
                    text: "26".tr,

                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  LinkText(
                    text: "7".tr,


                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
     ),
    ),
        ),
    );
  }


}