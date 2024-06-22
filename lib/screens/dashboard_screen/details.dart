import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/widgets/subtitle_places.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app%20color.dart';
import 'package:vixor_project/models/place%20model.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  Future<Placemodel> fetchPlaceById(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('Places').doc(id).get();
    if (doc.exists) {
      return Placemodel.fromFirestore(doc);
    } else {
      throw Exception('Place not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String placeId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Details',
          style: TextStyle(color: const Color(0xFF8D502F)),
        ),
      ),
      body: FutureBuilder<Placemodel>(
        future: fetchPlaceById(placeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Place not found'));
          }

          final place = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(place.PlaceImage),
                  SizedBox(height: 16),
                  TitlesTextWidget(
                    color: Colors.black,
                    label: place.PlaceTitle,
                  ),
                  Subtitle(
                    color: Colors.black,
                    label: place.PlaceDescription,
                  ),
                  // Text(place.PlaceTitle,
                  //     style:
                  //         TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  // SizedBox(height: 8),
                  // Text(place.PlaceDescription),
                  SizedBox(height: 8),

                  TitlesTextWidget(color: Colors.black, label: "Category :"),
                  Subtitle(
                    color: Colors.black,
                    label: "In  ${place.PlaceCategory}",
                  ),

                  TitlesTextWidget(color: Colors.black, label: "Address :"),
                  Subtitle(
                    color: Colors.black,
                    label: "In  ${place.PlaceAddress}",
                  ),

                  SizedBox(height: 8),
                  TitlesTextWidget(
                      color: Colors.black, label: "Best Time To Visit :"),
                  Subtitle(
                    color: Colors.black,
                    label: "In  ${place.BestTime}",
                  ),
                  SizedBox(height: 8),

                  TitlesTextWidget(
                      color: Colors.black, label: "Things to Know :"),
                  Subtitle(
                    color: Colors.black,
                    label: "In  ${place.thingToKnow}",
                  ),
                  SizedBox(height: 8),
                  // Text('Category: ${place.PlaceCategory}'),
                  //SizedBox(height: 8),
                  //Text('Address: ${place.PlaceAddress}'),
                  //SizedBox(height: 8),
                  //Text('Best Time: ${place.BestTime}'),
                  // SizedBox(height: 8),
                  // Text('Things to Know: ${place.thingToKnow}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
