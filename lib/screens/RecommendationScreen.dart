import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recommendation {
  final String name;
  final String address;
  final String photoUrl;

  Recommendation({
    required this.name,
    required this.address,
    required this.photoUrl,
  });
}

class RecommendationScreen extends StatefulWidget {
  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  List<Recommendation> recommendations = [];
  TextEditingController daysController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';
  int numDays = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
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
                labelText: 'Enter number of days',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              numDays = int.tryParse(daysController.text) ?? 1;
              setState(() {});
            },
            child: Text('Get Recommendations'),
          ),
          if (numDays > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                numDays,
                    (index) => ElevatedButton(
                  onPressed: () {
                    fetchRecommendations(index + 1);
                  },
                  child: Text('Day ${index + 1}'),
                ),
              ),
            ),
          if (isLoading)
            Center(child: CircularProgressIndicator())
          else if (errorMessage.isNotEmpty)
            Center(child: Text(errorMessage))
          else if (recommendations.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: recommendations.map((recommendation) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(recommendation.name),
                          subtitle: Text(recommendation.address),
                          leading: recommendation.photoUrl.isNotEmpty
                              ? Image.network(
                            recommendation.photoUrl,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                          )
                              : Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            color: Colors.grey,
                            child: Icon(Icons.photo, color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Future<void> fetchRecommendations(int day) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
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
          recommendations = jsonList[day - 1].map<Recommendation>((json) {
            return Recommendation(
              name: json['name'] ?? 'No Name',
              address: json['address'] ?? 'No Address',
              photoUrl: json['photo_url'] ?? '',
            );
          }).toList();
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load recommendations';
          print('Error: Server responded with status code ${response.statusCode}');
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        print('Error: $e');
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
