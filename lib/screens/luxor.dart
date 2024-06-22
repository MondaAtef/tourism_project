import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/drawer.dart';
import 'package:vixor_project/componenet/my_app_bar.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';


class luxor extends StatelessWidget {
  const luxor({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const Mydrawer(),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              color:const Color (0xFF8D502F).withOpacity(0.7),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * .40,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 0,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                  MediaQuery.of(context).size.width * .6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTextWidget(
                                    text: "Green tips in",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.left,
                                  ),
                                  const CustomTextWidget(
                                    text: "Luxor city",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffC78800),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.0),
                                        topLeft: Radius.zero,
                                        bottomRight: Radius.circular(50.0),
                                        bottomLeft: Radius.zero,
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0),
                                      child: CustomTextWidget(
                                        text: 'Introduction',
                                        fontSize: 29,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: CustomTextWidget(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      text:
                                      "Sustainability has become a pivotal concern in the global context,transcending \n various industries.  ",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 15,
                            right: 0,
                            child: SizedBox(
                              //width: MediaQuery.of(context).size.width * .5,
                                child: Image(image: AssetImage(Assets.forest))),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomTextWidget(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        text:
                        "In recent years, the tourism sector has witnessed a paradigm shift towards responsible and sustainable practices.As the world seeks ways to minimize its environmental footprint, Egypt is also embracing the concept of sustainable tourism to safeguard its rich cultural and natural heritage. ",
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(

                        padding: EdgeInsets.all(0),
                        child: CustomTextWidget(
                          text: 'Some Warnings',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          text:
                          "1)Environmental Conservation:\n Egypt, with its ancient wonders and natural beauty,  is taking steps to protect its ecosystems. Initiatives include wildlife conservation, waste management, and sustainable energy practices in tourist facilities.\n2)Cultural Preservation:\n  Preserving Egypt's rich cultural heritage is crucial for sustainable tourism. This involves responsible tourism practices, respectful behavior towards cultural sites, and initiatives to empower local communities. \n 3)Community Engagement:\n Involving local communities in the tourism industry fosters economic growth and social development. Empowering residents through job opportunities, training, and community-based tourism initiatives ensures that the benefits of tourism are shared equitably.",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xffC78800),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: CustomTextWidget(
                          text: 'Sustainable Tourism in Luxor',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          text:
                          "1)Conservation of Historical Sites:\nEgypt is home to iconic historical sites such as the Pyramids of Giza and the Sphinx. Sustainable tourism efforts focus on maintaining the integrity of these sites through controlled visitor numbers, preservation measures, and the promotion of responsible tourism practices.\n2)Eco-friendly Initiatives:\nEco-friendly accommodations, transportation, and activities are gaining traction in Egypt. From solar-powered hotels to low-impact transportation options, the tourism industry is aligning itself with sustainable practices.\n3)Cultural Immersion:\nSustainable tourism in Egypt emphasizes cultural exchange and immersive experiences. Visitors are encouraged to engage with local communities, participate in cultural events",
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
    );
  }
}
