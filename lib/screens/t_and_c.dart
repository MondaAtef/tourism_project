import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/utils/app_colors.dart';

class Tc extends StatelessWidget {
  const Tc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: 'Terms and Privacy Policy',
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color.fromARGB(255, 214, 214, 214),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CustomTextWidget(
                    color: Colors.black,
                    text:
                        "By downloading, installing, and using our app, you agree to comply with and be bound by these Terms. If you do not agree with these Terms, please do not use our app.\n\n"
                        "Use of the Application:\n\n"
                        "Eligibility:\n"
                        "You must be at least 18 years old to use our app. By using the app, you represent that you are of legal age to form a binding contract with us.\n\n"
                        "Account Registration: Some features of the app may require you to create an account. You agree to provide accurate and complete information when creating your account and to update your information as necessary.\n\n"
                        "User Conduct:\n"
                        "You agree to use the app only for lawful purposes. You are prohibited from using the app in a way that violates any applicable local, state, national, or international law.\n\n"
                        "Disclaimer of Warranties:\n"
                        "The app is provided on an \"as is\" and \"as available\" basis without warranties of any kind, either express or implied. We do not warrant that the app will be uninterrupted or error-free, that defects will be corrected, or that the app is free of viruses or other harmful components.",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
