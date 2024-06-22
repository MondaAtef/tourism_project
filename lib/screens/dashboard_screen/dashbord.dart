import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/models/list_item_model.dart';
import 'package:vixor_project/screens/dashboard_screen/details.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/home_item_list_1.dart';
import 'package:vixor_project/utils/app_imagse.dart';
import 'package:vixor_project/utils/app_colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<ListItemModell> itemModel = [
    ListItemModell(
        image: Assets.Ballon,
        text: 'Hot Air \n Balloon',
        id: '51f3fc18-4b5b-4fc0-9065-61e31c2a1673'),
    ListItemModell(
        image: Assets.Karnak,
        text: 'Karnak Temple in East',
        id: 'c1a1b6c3-898b-417f-a70d-267f5173ec06'),
    ListItemModell(
        image: Assets.nile,
        text: 'Nile Corniche In Luxor',
        id: '72a40038-6335-4b3f-ba24-9309907a9808'),
    ListItemModell(
        image: Assets.abo,
        text: 'Abo EL Hagaga Mosque',
        id: 'e23328a9-ee95-4029-b496-3f6897c1ec38'),
    ListItemModell(
        image: Assets.churach,
        text: 'Church of the Virgin Mary',
        id: '197738d5-b223-44a1-b572-1db70674d8a4'),
    ListItemModell(
        image: Assets.vellay,
        text: 'Valley of the Kings Temple',
        id: '65cce395-92cc-4f07-b08d-c2822f5bffb1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image(
            image: AssetImage(Assets.background),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Semi-transparent color overlay
          Container(
            color: const Color(0xFF8D502F).withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  ClipRRect(
                    child: SizedBox(
                      height: 250,
                      child: Swiper(
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                            AppConstants.bannersImages[index],
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: AppConstants.bannersImages.length,
                        pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                            activeColor: AppColors.primaryColor,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitlesTextWidget(
                        label: "Top Places", color: Colors.white),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .23,
                      child: Row(
                        children: itemModel.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20), // Adjust radius for rounded but not circular shape
                                      border: Border.all(
                                        color: Colors.white,
                                        width:
                                            2, // Optional: Add a border around the container
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            PlaceDetailScreen.routeName,
                                            arguments: item.id,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20), // Match radius with the container
                                          child: Image.asset(
                                            item.image,
                                            width:
                                                80, // Adjust width to not take full container space
                                            height:
                                                80, // Adjust height to not take full container space
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.text,
                                    style: const TextStyle(
                                        color: Colors
                                            .white), // Set text color to white
                                    textAlign:
                                        TextAlign.center, // Center the text
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const ItemList1(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
