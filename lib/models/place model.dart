import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Placemodel with ChangeNotifier {
  final String PlaceId,
      PlaceTitle,
      PlaceAddress,
      //latitude,
      //longitude,
      PlaceCategory,
      PlaceDescription,
      PlaceImage,
      thingToKnow,
      BestTime;
  Timestamp? createdAt;
  Placemodel({
    required this.PlaceId,
    required this.PlaceAddress,
    //required this.latitude,
    //required this.longitude,
    required this.PlaceTitle,
    required this.PlaceCategory,
    required this.PlaceDescription,
    required this.PlaceImage,
    required this.BestTime,
    required this.thingToKnow,


    this.createdAt,
  });

  factory Placemodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Placemodel(
      PlaceId: data["PlaceId"],
      PlaceTitle: data['PlaceTitle'],
      PlaceAddress: data['PlaceAddress'],
      PlaceCategory: data['PlaceCategory'],
      PlaceDescription: data['PlaceDescription'],
      PlaceImage: data['PlaceImage'],
      BestTime:data['BestTime'],
      createdAt: data['createdAt'],
      thingToKnow:data['thingToKnow'],
     // latitude:data['latitude'],
      //longitude:data['longitude'],

    );
  }


}
