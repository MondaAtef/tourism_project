import 'package:flutter/material.dart';
import 'package:vixor_project/utils/assets_manager.dart';

class CategoriesModel {
  final String id;
  final String image;
  final String name;


  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,

  });
}
class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Green Hotels ',
    'Resturant',
    'Historical landmarks (west)',
    'Historical landmarks (East)',
    'leisure tourism',
    'Religious tourism',
  ];

  static List<CategoriesModel> categoyList = [
    CategoriesModel(
      id: "Green Hotels ",
      image: AssetsManager.hotels,
      name: "Green Hotels ",
    ),
    CategoriesModel(
      id: "Resturant",
      image: AssetsManager.Resturant,
      name: "Resturant",
    ),
    CategoriesModel(
      id: "Historical landmarks (west)",
      image: AssetsManager.west,
      name: "Historical landmarks (west)",

    ),
    CategoriesModel(
      id: "Historical landmarks (East)",
      image: AssetsManager.east,
      name: "Historical landmarks (East)",

    ),
    CategoriesModel(
      id: "leisure tourism",
      image: AssetsManager.leusrios,
      name: "leisure tourism",

    ),
    CategoriesModel(
      id: "Religious tourism",
      image: AssetsManager.religious,
      name: "Religious tourism",

    ),

  ];
  static List<String> bannersImages = [
    AssetsManager.banner4,
    AssetsManager.banner5,
    AssetsManager.banner6,
    AssetsManager.banner3,



  ];
  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
    List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
          (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }
}