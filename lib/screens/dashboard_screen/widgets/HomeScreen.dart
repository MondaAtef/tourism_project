import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:vixor_project/componenet/widgets/cat.dart';
import 'package:vixor_project/componenet/widgets/namewidget.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Assets.imagesLogow,
          ),
        ),
        title: const AppNameTextWidget(fontSize: 30),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Image(
            image: AssetImage(Assets.background),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Semi-transparent color overlay
          Container(
            color: const Color(0xFF8D502F).withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const TitlesTextWidget(label: "Categories", color: Colors.white,fontSize:25),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: size.width * 0.9,  // Adjust width here
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: AppConstants.categoyList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 208, 208, 208).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: CategoryRoundedWidget(
                              image: AppConstants.categoyList[index].image,
                              name: AppConstants.categoyList[index].name,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Gap(15);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
