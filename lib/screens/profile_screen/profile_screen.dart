import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vixor_project/componenet/widgets/text_widget.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/cubit/bloc.dart';
import 'package:vixor_project/cubit/states.dart';
import 'package:vixor_project/provider/theme_provider.dart';
import 'package:vixor_project/screens/auth/forget%20password.dart';
import 'package:vixor_project/screens/auth/login_screen.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/CustomListTile.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/viewed_recently.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/wishlist.dart';
import 'package:vixor_project/screens/profile_screen/Edit%20profile.dart';
import 'package:vixor_project/utils/assets_manager.dart';
import 'package:vixor_project/utils/app_imagse.dart';



class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final User? user = authInstance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var usermodel = NewsCubit.get(context).usermodel;

        return Stack(
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: usermodel != null
                    ? Column(
                  children: [
                    Container(
                      height: 190.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage:
                              NetworkImage('${usermodel.image}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${usermodel.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '${usermodel.bio}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${usermodel.shopping_address}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      '${usermodel.phone}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 35.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: Colors.white, width: 1),
                              ),
                              child: OutlinedButton(
                                onPressed: () async {
                                  await launchUrl(
                                      Uri.parse("tel:+201284464432"));
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.phone_callback_outlined,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "27".tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            height: 35,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                  color: Colors.white, width: 1),
                            ),
                            child: InkWell(
                              onTap: () {
                                navigateTo(context, EditProfile());
                              },
                              child: Center(
                                child: Text(
                                  "28".tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomListTile(
                      text: "29".tr,
                      imagePath: AssetsManager.wishlistSvg,
                      function: () {
                        Navigator.pushNamed(
                            context, WishlistScreen.routName);
                      },

                    ),
                    CustomListTile(
                      text: "30".tr,
                      imagePath: AssetsManager.recent,
                      function: () {
                        Navigator.pushNamed(
                            context, ViewedRecentlyScreen.routName);
                      },

                    ),
                    listtile(
                      title: "31".tr,
                      icon: IconlyLight.unlock,
                      color: Colors.white,
                      onpressed: () {
                        navigateTo(context, const ForgetPasswordScreen());
                      },
                    ),
                    listtile(
                      title: user == null ? '7'.tr : '32'.tr,
                      icon: user == null
                          ? IconlyLight.login
                          : IconlyLight.logout,
                      color: Colors.white,
                      onpressed: () {
                        if (user == null) {
                          navigateTo(context, const Login());
                          return;
                        }
                        warningDialog(
                          title: '33'.tr,
                          subtitle: '34'.tr,
                          fct: () async {
                            await authInstance.signOut();
                            navigateTo(context, const Login());
                          },
                          context: context,
                        );
                      },
                    ),
                  ],
                )
                    : const SizedBox(),
              ),
            ),
          ],
        );
      },
    );
  }
}