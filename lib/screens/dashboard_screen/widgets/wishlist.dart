import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/empty_bag.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/wishlist_provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/placewidget2.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';


class WishlistScreen extends StatefulWidget {
  static const routName = "/WishlistScreen";
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final bool isEmpty = true;
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
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlists.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.bagWish,
        title: "66".tr,
        subtitle:'',
        buttonText: "67".tr,
      ),
    )
        : Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.hors,
          ),
        ),
        title: TitlesTextWidget(
          label: "69".tr,
            //label: "69(${wishlistProvider.getWishlists.length})",
            color: Colors.brown,// Set the text color to brown


        ),
        actions: [
          IconButton(
            onPressed: () {
              MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "68".tr,
                fct: () async {
                  await wishlistProvider.clearWishlistFromFirebase();
                  wishlistProvider.clearLocalWishlist();
                },
              );
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        builder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceWidget2(
              productId: wishlistProvider.getWishlists.values
                  .toList()[index]
                  .productId,
            ),
          );
        },
        itemCount: wishlistProvider.getWishlists.length,
        crossAxisCount: 2,
      ),
    );
  }
}