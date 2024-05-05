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
            const Text(
              'vixor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 2,
                color: Color(0xd18e4f2e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
