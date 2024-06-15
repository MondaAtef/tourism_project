import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Placemodel with ChangeNotifier {
  final String PlaceId,
      PlaceTitle,
      PlaceAddress,
      PlaceCategory,
      PlaceDescription,
      PlaceImage,
      BestTime;
  /* Ticketforadult,
      TicketforStudent,
      openedat,
      closedat,*/
  Timestamp? createdAt;
  Placemodel({
    required this.PlaceId,
    required this.PlaceAddress,
    required this.PlaceTitle,
    required this.PlaceCategory,
    required this.PlaceDescription,
    required this.PlaceImage,
    required this.BestTime,

    this.createdAt,
    /*required this.Ticketforadult,
    required this.TicketforStudent,
    required this.closedat,
    required this.openedat,*/
  });

  factory Placemodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    // data.containsKey("")
    return Placemodel(
      PlaceId: data["PlaceId"], //doc.get(field),
      PlaceTitle: data['PlaceTitle'],
      PlaceAddress: data['PlaceAddress'],
      PlaceCategory: data['PlaceCategory'],
      PlaceDescription: data['PlaceDescription'],
      PlaceImage: data['PlaceImage'],
      BestTime:data['BestTime'],
      createdAt: data['createdAt'],
      //Ticketforadult: data['Ticketforadult'],
     // TicketforStudent: data['TicketforStudent'],
      //closedat: data['closedat'],
      //openedat: data['openedat'],

    );
  }
}
