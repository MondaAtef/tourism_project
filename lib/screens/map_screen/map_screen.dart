// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   double lat1 = 30.7124815;
//   double long1 = 31.1069703;
//   double lat2 = 33.7124815;
//   double long2 = 35.1069703;
//   List<Marker> markers = [
//     // Marker(markerId: MarkerId("1"),
//     // position: LatLng(25.692028,32.663452)
//     // ),
//   ];
//   GoogleMapController? gmc;
//   _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('الرجاء تشغيل خدمة الموقع علي جهازك');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     if (permission == LocationPermission.whileInUse) {
//       double distanceInMeters =
//           Geolocator.distanceBetween(lat1, long1, lat2, long2);
//       if (kDebugMode) {
//         print("======================");
//       }
//       if (kDebugMode) {
//         print(distanceInMeters / 1000);
//       }
//     }
//   }

//   CameraPosition cameraPosition = const CameraPosition(
//     target: LatLng(25.692028, 32.663452),
//     zoom: 12,
//   );
//   @override
//   void initState() {
//     _determinePosition();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 GoogleMap(
//                   onTap: (LatLng latLng) {
//                     if (kDebugMode) {
//                       print("=====================");
//                     }
//                     if (kDebugMode) {
//                       print(latLng.latitude);
//                     }
//                     if (kDebugMode) {
//                       print(latLng.longitude);
//                     }
//                     if (kDebugMode) {
//                       print("=====================");
//                     }
//                     markers.add(Marker(
//                         markerId: const MarkerId("1"),
//                         position: LatLng(latLng.latitude, latLng.longitude)));
//                     setState(() {});
//                   },
//                   markers: markers.toSet(),
//                   mapType: MapType.normal,
//                   initialCameraPosition: cameraPosition,
//                   onMapCreated: (mapcontroller) {
//                     gmc = mapcontroller;
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double lat1 = 30.7124815;
  double long1 = 31.1069703;
  double lat2 = 33.7124815;
  double long2 = 35.1069703;
  List<Marker> markers = [];

  GoogleMapController? gmc;

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('الرجاء تشغيل خدمة الموقع علي جهازك');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse) {
      double distanceInMeters =
          Geolocator.distanceBetween(lat1, long1, lat2, long2);
      if (kDebugMode) {
        print("======================");
      }
      if (kDebugMode) {
        print(distanceInMeters / 1000);
      }
    }
  }

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(25.692028, 32.663452),
    zoom: 12,
  );

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onTap: (LatLng latLng) {
                    if (kDebugMode) {
                      print("=====================");
                    }
                    if (kDebugMode) {
                      print(latLng.latitude);
                    }
                    if (kDebugMode) {
                      print(latLng.longitude);
                    }
                    if (kDebugMode) {
                      print("=====================");
                    }
                    markers.add(Marker(
                        markerId: const MarkerId("1"),
                        position: LatLng(latLng.latitude, latLng.longitude)));
                    setState(() {});
                  },
                  markers: markers.toSet(),
                  mapType: MapType.normal,
                  initialCameraPosition: cameraPosition,
                  onMapCreated: (mapcontroller) {
                    gmc = mapcontroller;
                  },
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageColumn(Assets.imagesWall1, 'Hotel'),
                _buildImageColumn(Assets.imagesWall1, 'Restaurant'),
                _buildImageColumn(Assets.imagesWall1, 'Hand Crafts'),
                _buildImageColumn(Assets.imagesWall1, 'Historical'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageColumn(String imagePath, String text) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //border: Border.all(color: Colors.black, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
