import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/models/list_item_model.dart';
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
    ListItemModell(image: Assets.imagesWall1, text: 'Ballon '),
    ListItemModell(image: Assets.imagesWall1, text: 'Luxor Temple'),
    ListItemModell(image: Assets.imagesWall1, text: 'karnak Temple'),
    ListItemModell(image: Assets.imagesWall1, text: 'Abo EL Hagaga Mosque'),
    ListItemModell(
        image: Assets.imagesWall1, text: 'Church of the Virgin Mary'),
    ListItemModell(
        image: Assets.imagesWall1, text: 'Valley of the Kings Temple'),
    ListItemModell(image: Assets.imagesWall1, text: 'Nile Corniche'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(color: AppColors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  ClipRRect(
                    child: SizedBox(
                      height: 200,
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
                    child: TitlesTextWidget(label: "Top Places"),
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
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            156, 54, 52, 52),
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          item.image,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(item.text),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //const SizedBox(height: 20),
                  const ItemList1(),
                  // const SizedBox(height: 30),
                  // const HomeItem3(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
