import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/cubit/bloc.dart';
import 'package:vixor_project/cubit/states.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class EditProfile extends StatelessWidget {
  var namecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is SocialUserUpdateSuccessState) {
          Fluttertoast.showToast(
            msg: "37".tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xFF8D502F).withOpacity(0.9),
            textColor: Colors.white,
            fontSize: 15.0,
          );
        }
      },
      builder: (context, state) {
        var usermodel = NewsCubit.get(context).usermodel;
        var profileimage = NewsCubit.get(context).profileImage;

        namecontroller.text = usermodel!.name!;
        biocontroller.text = usermodel.bio!;
        phonecontroller.text = usermodel.phone!;
        titlecontroller.text = usermodel.shopping_address!;

        return Scaffold(
          body: Stack(
            children: [
              Image(
                image: AssetImage(Assets.wall), // Ensure this path is correct
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                color: const Color(0xFF8D502F).withOpacity(0.8),
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 400, // Adjust the width as needed
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color:Color(0xFF8D502F).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 33, 126, 180),
                        Color.fromARGB(200, 142, 80, 46),
                      ],
                      stops: [0.0, 0.5],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.8),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (state is SocialUserUpdateLoadingState)
                          const LinearProgressIndicator(),
                        if (state is SocialUserUpdateLoadingState)
                          const SizedBox(height: 10.0),
                        SizedBox(
                          height: 190.0,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 64.0,
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundImage: profileimage == null
                                          ? NetworkImage('${usermodel.image}')
                                          : FileImage(profileimage) as ImageProvider,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      NewsCubit.get(context).getProfileImage();
                                    },
                                    icon: const CircleAvatar(
                                      radius: 20.0,
                                      child: Icon(
                                        IconlyLight.camera,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        if (NewsCubit.get(context).profileImage != null)
                          Row(
                            children: [
                              if (NewsCubit.get(context).profileImage != null)
                                Expanded(
                                  child: Column(
                                    children: [
                                      defaultButton(
                                        function: () {
                                          NewsCubit.get(context).UploadProfileImage(
                                            name: namecontroller.text,
                                            phone: phonecontroller.text,
                                            bio: biocontroller.text,
                                            title: titlecontroller.text,
                                          );
                                        },
                                        text: '36'.tr,
                                        background: Color.fromARGB(255, 208, 208, 208),
                                      ),
                                      if (state is SocialUserUpdateLoadingState)
                                        const SizedBox(height: 5),
                                      if (state is SocialUserUpdateLoadingState)
                                        const LinearProgressIndicator(),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        const SizedBox(height: 20.0),
                        defaultformfield(
                          controller: namecontroller,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty && value != null) {
                              return '38'.tr;
                            }
                            return null;
                          },
                          label: '39'.tr,
                          prefix: IconlyLight.user2,
                        ),
                        const SizedBox(height: 10.0),
                        defaultformfield(
                          controller: biocontroller,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty && value != null) {
                              return '40'.tr;
                            }
                            return null;
                          },
                          label: '41'.tr,
                          prefix: IconlyLight.infoSquare,
                        ),
                        const SizedBox(height: 10.0),
                        defaultformfield(
                          controller: phonecontroller,
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty && value != null) {
                              return '42'.tr;
                            }
                            return null;
                          },
                          label: '43'.tr,
                          prefix: IconlyLight.call,
                        ),
                        const SizedBox(height: 10.0),
                        defaultformfield(
                          controller: titlecontroller,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty && value != null) {
                              return '44'.tr;
                            }
                            return null;
                          },
                          label: '45'.tr,
                          prefix: IconlyLight.chart,
                        ),
                        const SizedBox(height: 20.0),
                        defaultButton(
                          function: () async {
                            NewsCubit.get(context).updataUser(
                              name: namecontroller.text,
                              phone: phonecontroller.text,
                              bio: biocontroller.text,
                              title: titlecontroller.text,
                            );
                          },
                          text: '35'.tr,
                          background: Color.fromARGB(255, 208, 208, 208),
                          radius: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
