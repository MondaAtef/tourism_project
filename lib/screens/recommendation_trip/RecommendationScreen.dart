import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:vixor_project/screens/recommendation_trip/Generate_trip.dart';
import 'package:vixor_project/screens/recommendation_trip/Recommendation.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class RecommendationScreen extends StatefulWidget {
  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  TextEditingController daysController = TextEditingController();
  int numDays = 0;
  List<List<Recommendation>> allRecommendations = [];

  void fetchRecommendations(int numDays) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.3:5000/recommend'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'num_days': numDays}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        allRecommendations = List.generate(numDays, (index) {
          return List<Recommendation>.from(
              jsonList[index].map((json) => Recommendation.fromJson(json)));
        });
      });
    } else {
      // Handle error
      print('Failed to load recommendations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      appBar: AppBar(
        title: Text(
          '97'.tr,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent, // Makes the AppBar transparent
        elevation: 0, // Removes shadow under the AppBar
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage(Assets.background), // Ensure this path is correct
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: const Color(0xFF8D502F).withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: daysController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '98'.tr,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    int newNumDays = int.tryParse(daysController.text) ?? 1;
                    if (newNumDays != numDays) {
                      numDays = newNumDays;
                      fetchRecommendations(numDays);
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(200, 50),
                    backgroundColor: Color.fromARGB(255, 208, 208, 208).withOpacity(0.8),
                  ),
                  child: Text('99'.tr,
                    style: GoogleFonts.oxanium(
                      textStyle: TextStyle(
                        color: Color.fromARGB(167, 33, 126, 180),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                  ),
                ),
                ),
                if (numDays > 0)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: List.generate(
                                numDays,
                                    (index) => ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GenerateTrip(
                                          day: index + 1,
                                          recommendations: allRecommendations[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('${"96".tr} ${index + 1}',
                                    style: GoogleFonts.oxanium(
                                      textStyle: TextStyle(
                                        color: Color.fromARGB(167, 33, 126, 180),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
