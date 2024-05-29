import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/searchscreen.dart';

class CategorydashWidget extends StatelessWidget {
  const CategorydashWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigateTo(context, SearchScreen());
        Navigator.pushNamed(context, SearchScreen.routeName, arguments: name);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:Colors.white,
            //color: const Color.fromARGB(255, 183, 178, 178),
            // Border color
            //color: AppColors.gray, // Border color
            width: 2, // Border width
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const Gap(15),
            const SizedBox(
              height: 5,
            ),
            SubtitleTextWidget(
              label: name,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
