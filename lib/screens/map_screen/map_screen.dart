import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double lat1 = 20.7124815;
  double long1 = 20.1069703;
  double lat2 = 20.7124815;
  double long2 = 20.1069703;
  List<Marker> markers = [
    // Marker(markerId: MarkerId("1"),
    // position: LatLng(25.692028,32.663452)
    // ),

                               //Hotels

  Marker(
  markerId: const MarkerId('2'),
  position: const LatLng(25.694636426028495, 32.635042358490956),//Iberotel Luxor
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueGreen,
      )
  ),
    Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(25.696681382544458, 32.637133401059536),//Sofitel Winter Palace Luxor
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        )
    ),
    Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(25.669301193437615, 32.629178600014775),//Jolie Ville Luxor
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        )
    ),
    Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(25.688672019416494, 32.631294029680134),//Sonesta St. George Luxor
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        )
    ),
    Marker(
        markerId: const MarkerId('6'),
        position: const LatLng(25.68761056504006, 32.631240770994886),//Steigenberger Nile Palace Luxor
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        )
    ),

                    //restaurants

    Marker(
        markerId: const MarkerId('7'),
        position: const LatLng(25.68741191198433, 32.63297322743537),//Aisha Restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
     Marker(
        markerId: const MarkerId('8'),
        position: const LatLng(25.702617, 32.633777),//Tutankhamon Restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('9'),
        position: const LatLng(25.701635068098227, 32.64219178382697),//Al-Sahabi neighborhood
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('10'),
        position: const LatLng(25.687353, 32.633405),//Snobs
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('11'),
        position: const LatLng(25.687321, 32.633240),//fanos rom
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('12'),
        position: const LatLng(25.687416774553476, 32.633347701197906),//Loqma Restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('13'),
        position: const LatLng(25.698368324389648, 32.63056324511067),//Nobian house restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('14'),
        position: const LatLng(25.691885724420747, 32.639027886829346),//Sofra el-beit elkeber
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('15'),
        position: const LatLng(25.70391281284584, 32.63346513340122),//الواحة
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('16'),
        position: const LatLng(25.693096229025134, 32.639931001254375),//كشري الاسكندراني
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('17'),
        position: const LatLng(25.71822696388909, 32.60230377448295),//Café & Restaurant Maratonga
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('18'),
        position: const LatLng(25.696399236135946, 32.643658938343556),//كشري السلطان
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('19'),
        position: const LatLng(25.732700586967287, 32.62810891128872),//معبد سيتى الأول
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('20'),
        position: const LatLng(25.68766217740584, 32.63108363334124),//El Tarboush restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('21'),
        position: const LatLng(25.69678217316446, 32.636220633340926),//El-kababgy Luxor
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('22'),
        position: const LatLng(25.6995012994886, 32.6390505713396),//Luxor temple//////////////////////////////////
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('23'),
        position: const LatLng(25.703095048140778, 32.63350075091241),//sunflower restaurant
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )
    ),
    Marker(
        markerId: const MarkerId('24'),
        position: const LatLng(25.7188339732626, 32.65727030389259),//Karnak temple
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('25'),
        position: const LatLng(25.702315973188945, 32.63984970389306),//mummification museum
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('26'),
        position: const LatLng(25.69979397317803, 32.641574127206304),//tourist market
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('27'),
        position: const LatLng(25.719099265019214, 32.60411300389258),// Caravanserai Luxor Egyptian Handicrafts
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),    Marker(
        markerId: const MarkerId('28'),
        position: const LatLng(25.72742604385657, 32.657716989608794),// papyrus Handicrafts
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('29'),
        position: const LatLng(25.700140830253904, 32.64136138241646),//Habiba gallery
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('30'),
        position: const LatLng(25.70419517319762, 32.64169577444526),//سوق سافوي السياحي بالاقصر
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('31'),
        position: const LatLng(25.6999333731786, 32.64113460389313),//Fair Trade Center
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('32'),
        position: const LatLng(25.70006448874953, 32.64113929775864),//Ata Bazar
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('33'),
        position: const LatLng(25.696464429947934, 32.636819259930455),//Nobles Art Gallery
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        )
    ),
    Marker(
        markerId: const MarkerId('34'),
        position: const LatLng(25.740163369131064, 32.60141065455772),//Valley of the Kings
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('35'),
        position: const LatLng(25.728564347411833, 32.59292214537445),//valley of queens
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('36'),
        position: const LatLng(25.719505791225348, 32.60077820879072),//Medinet Habu
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('37'),
        position: const LatLng(25.73827621116321, 32.60649091838846),//Temple of Hatshepsut
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('38'),
        position: const LatLng(25.74073491798299, 32.60095980800764),//tomb of Mernbtah
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('39'),
        position: const LatLng(25.740370173358663, 32.60140770389203),//Tutankhamun's tomb
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('40'),
        position: const LatLng(25.293616601894865, 32.55611627628099),//Temple of Khnum (Temple of Asna)
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('41'),
        position: const LatLng(25.728043373294906, 32.60142567444183),//Deir El-Medina
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('42'),
        position: const LatLng(25.720580524009442, 32.61052985273438),//Colossi of Memnon
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('42'),
        position: const LatLng(25.70761354127543, 32.64454915796643),//Luxor museum
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('43'),
        position: const LatLng(25.718844243363005, 32.65727030389262),//Karnak temple
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('44'),
        position: const LatLng(25.73075027331536, 32.609339703892424),//tomb of Nobles
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('45'),
        position: const LatLng(25.70852278526077, 32.64873344842476),//Avenue of Sphinxes
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('46'),
        position: const LatLng(25.740351773358018, 32.60129970389222),//Ramses V & VI
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('47'),
        position: const LatLng(25.716552530305265, 32.655810894942675),//tomb of khenso
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
    Marker(
        markerId: const MarkerId('48'),
        position: const LatLng(25.69986972333942, 32.63977385466763),//Abu El-Haggag Mosque
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('49'),
        position: const LatLng(25.705420549437473, 32.64481327569153),//the Church of the Virgin Mary
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('50'),
        position: const LatLng(25.74037110749175, 32.60140769495029),//	Tomb of King Tutankhamun (Tut)
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('51'),
        position: const LatLng(25.69986972333942, 32.63977385466763),//Al-Omari Mosque
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
          Marker(
        markerId: const MarkerId('52'),
        position: const LatLng(25.740351773367713, 32.60129903331981),//Tomb of Ramses VI
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),    Marker(
        markerId: const MarkerId('53'),
        position: const LatLng(25.711662177390487, 32.65521250389274),//Mut temple
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        )
    ),
  ];
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
    zoom: 14,
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
        ],
      ),
    );
  }
}
