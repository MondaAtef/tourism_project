
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/cubit/cashe%20helper.dart';
import 'package:vixor_project/cubit/states.dart';
import 'package:vixor_project/models/Newsusermodel.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(SocialInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  static final User? user = authInstance.currentUser;
  NewsUserModel? usermodel;
  final _uid = user!.uid;
  bool isdark = false;

 /* void changeappmode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(AppChangeDarkState());
    }
    else {
      isdark = !isdark;
      CachHelper.putBoolean(key: 'isdark', value: isdark).then((value) {
        emit(AppChangeDarkState());
      });
    }
  }*/

  Future getUserData() async
  {
    emit(SocialGetUserLoadingState());
    await FirebaseFirestore.instance.collection('users').
    doc(_uid).get()
        .then((value) {
      // print(value.data());
      usermodel = NewsUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
      throw error;
    });
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  void UploadProfileImage
      ({
    required String name,
    required String phone,
    required String title,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updataUser(name: name,
            phone: phone,
            bio: bio,
            image: value,
            title: title);
      }).catchError((error) {
        emit(SocialuploadimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadimageErrorState());
    });
  }
  void updataUser({
    required String name,
    required String phone,
    required String bio,
    required String title,
    //String? cover,
    String? image,
  }) {
    NewsUserModel model = NewsUserModel(
      name: name,
      phone: phone,
      bio: bio,
      shopping_address: title,
      email: usermodel!.email,
      image: image ?? usermodel!.image!,
      id: usermodel!.id,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users')
        .doc(model.id).update(model.toMap())
        .then((value) {
      getUserData();
      emit(SocialUserUpdateSuccessState());
    })
        .catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  int currentindex = 0;

  void changeindex(int index) {
    currentindex = index;
    emit(AppChangeBottomState());
  }
}