import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/models/place%20model.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/wishlist_provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/placewidget2.dart';
import 'package:vixor_project/utils/assets_manager.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final productsProvider =
    Provider.of<HomeProvider>(context, listen: false);
    final wishlistsProvider =
    Provider.of<WishlistProvider>(context, listen: false);
    try {
      Future.wait({
        productsProvider.fetchProducts(),
        wishlistsProvider.fetchWishlist(),
      });
    } catch (error) {
      log(error.toString());
    }
  }
  @override
  void didChangeDependencies() {
    if (isLoadingProd) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<Placemodel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productsProvider =
    Provider.of<HomeProvider>(context, listen: false);
    String? passedCategory =
    ModalRoute.of(context)!.settings.arguments as String?;
    List<Placemodel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.hors,
            ),
          ),
          title: TitlesTextWidget(
              color: Color(0xFF8D502F),
              label: passedCategory ?? "101".tr),
        ),
          body: productList.isEmpty
              ?  Center(child: TitlesTextWidget(label: "102".tr))
            : StreamBuilder<List<Placemodel>>(
            stream: productsProvider.fetchProductsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: SelectableText(snapshot.error.toString()),
                );
              } else if (snapshot.data == null) {
                return  Center(
                  child: SelectableText("103".tr),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "104".tr,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // setState(() {
                            FocusScope.of(context).unfocus();
                            searchTextController.clear();
                            // });
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     productListSearch = productsProvider.searchQuery(
                      //         searchText: searchTextController.text);
                      //   });
                      // },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productsProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                       Center(
                        child: TitlesTextWidget(label: "105".tr),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        builder: (context, index) {
                          return PlaceWidget2(
                            productId: searchTextController.text.isNotEmpty
                                ? productListSearch[index].PlaceId
                                : productList[index].PlaceId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}