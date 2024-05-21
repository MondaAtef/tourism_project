// lib/screens/recommendation_trip/RecommendationScreen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vixor_project/screens/recommendation_trip/Generate_trip.dart';
import 'package:vixor_project/screens/recommendation_trip/Recommendation.dart';

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
          return jsonList[index].map<Recommendation>((json) {
            return Recommendation.fromJson(json);
          }).toList();
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
      appBar: AppBar(
        title: Text(
          'Trip',
          style: TextStyle(
            color: Colors.brown, // Change text color to brown
          ),
        ),
          iconTheme: IconThemeData(color: Colors.brown),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number Of Days',
                border: OutlineInputBorder(),
              ),
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

            child: Text('Get Your Trip'),
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

                            child: Text('Day ${index + 1}'),
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
    );
  }
}
