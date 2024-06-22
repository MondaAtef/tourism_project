import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/namewidget.dart';
import 'package:vixor_project/componenet/widgets/subtitle_places.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/componenet/widgets/title widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/heartbtn.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';

import '../../map_screen/map_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routName = "/ProductDetailsScreen";

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<HomeProvider>(context);
    String? productId =
    ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productId!);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: getCurrProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FancyShimmerImage(
              imageUrl: getCurrProduct.PlaceImage,
              height: size.height * 0.38,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreen(),
                            ),
                          );
                        },
                        icon: Container(
                          padding: EdgeInsets.all(10), // Adjust padding as needed
                          decoration: BoxDecoration(
                            color: Colors.brown.shade100, // Replace with your desired background color
                            borderRadius: BorderRadius.circular(8), // Optional: Add border radius
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.car_crash_outlined),
                              SizedBox(width: 5),
                              Text(
                                'Map',
                                style: TextStyle(
                                  fontSize: 16, // Adjust text size as needed
                                  fontWeight: FontWeight.bold, // Optional: Adjust text style
                                  color: Colors.white, // Optional: Adjust text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      HeartButtonWidget(
                       // bkgColor: Colors.blue.shade100,
                        productId: getCurrProduct.PlaceId,
                      ),


                    ],
                  ),
                  const SizedBox(height: 20),
                 SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*const TitlesTextWidget(
                      color: Colors.black,
                      label: "Name:" ,),*/
                      TitlesTextWidget(
                      color: Colors.black,
                      label:
                      "${getCurrProduct.PlaceTitle}",
                    ),
                    ],
                  ),
                 ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const TitlesTextWidget(
                          color: Colors.black,
                          label: "Category :"),
                      Subtitle(
                        color: Colors.black,
                        label:
                        "In ${getCurrProduct.PlaceCategory}",
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitlesTextWidget(
                            color: Colors.black,
                            label: "The Best Time :"),
                        Subtitle(
                          color: Colors.black,
                          label: "${getCurrProduct.BestTime}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const TitlesTextWidget(
                            color: Colors.black,
                            label: "Description :"),
                        Subtitle(
                          color: Colors.black,
                          label:
                          "${getCurrProduct.PlaceDescription}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitlesTextWidget(
                            color: Colors.black,
                            label:
                            "Things to Know Before you go :"),
                        Subtitle(

                          color: Colors.black,
                          label:
                          "${getCurrProduct.thingToKnow}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
