import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/empty_bag.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/view%20provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/placewidget2.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';
import 'package:vixor_project/utils/assets_manager.dart';


class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);

    return viewedProdProvider.getViewedProds.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.viewed,
        title: "77".tr,
        buttonText: "78".tr,
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
          color: Color(0xFF8D502F),
            label: "30".tr,
        ),
        actions: [
          IconButton(

            onPressed: () {
               MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "79".tr,
                fct: () {
                viewedProdProvider.clearHistory();
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.amber,
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
                productId: viewedProdProvider.getViewedProds.values
                    .toList()[index]
                    .productId),
          );
        },
        itemCount: viewedProdProvider.getViewedProds.length,
        crossAxisCount: 2,
      ),
    );
  }
}