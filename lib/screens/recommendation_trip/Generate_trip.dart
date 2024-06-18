import 'package:flutter/material.dart';
import 'package:vixor_project/screens/recommendation_trip/Recommendation.dart';
import 'package:vixor_project/utils/app_imagse.dart';
class GenerateTrip extends StatelessWidget {
  final int day;
  final List<Recommendation> recommendations;

  GenerateTrip({
    required this.day,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      appBar: AppBar(
        title: Text(
          'Day $day',
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
          recommendations.isNotEmpty
              ? ListView.builder(
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      recommendation.photoUrl.isNotEmpty
                          ? Image.network(
                        recommendation.photoUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                            Icon(Icons.error, size: 100),
                      )
                          : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey,
                        child: Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recommendation.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              recommendation.address,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
              : Center(child: Text('No recommendations available')),
        ],
      ),
    );
  }
}
