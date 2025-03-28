// The the app bar of sign up and login page__________________
import 'package:flutter/material.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Padge extends StatelessWidget {
  const Padge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(Assets.imagesLogo),
                ),
              ),
            ),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
