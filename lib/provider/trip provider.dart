/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';
import 'package:vixor_project/models/cart%20model.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';

class TripProvider with ChangeNotifier {
  final Map<String, TripModel> _cartItems = {};
  Map<String, TripModel> get getCartitems {
    return _cartItems;
  }

  final userstDb = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;
// Firebase
  Future<void> addToCartFirebase({
    required String productId,
    required int qty,
    required BuildContext context,
  }) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Please login first",
        fct: () {},
      );
      return;
    }
    final uid = user.uid;
    final cartId = const Uuid().v4();
    try {
      await userstDb.doc(uid).update({
        'userTrip': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': qty,
          }
        ])
      });
      await fetchCart();
      Fluttertoast.showToast(msg: '62'.tr,
        backgroundColor: Colors.brown.shade600,
        textColor: Colors.white,
        fontSize: 16.0,);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchCart() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      _cartItems.clear();
      return;
    }
    try {
      final userDoc = await userstDb.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey('userTrip')) {
        return;
      }
      final leng = userDoc.get("userTrip").length;
      for (int index = 0; index < leng; index++) {
        _cartItems.putIfAbsent(
          userDoc.get("userTrip")[index]['productId'],
              () => TripModel(
              cartId: userDoc.get("userTrip")[index]['cartId'],
              productId: userDoc.get("userTrip")[index]['productId'],
              quantity: userDoc.get("userTrip")[index]['quantity']),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeCartItemFromFirestore({
    required String cartId,
    required String productId,
    required int qty,
  }) async {
    final User? user = _auth.currentUser;
    try {
      await userstDb.doc(user!.uid).update({
        'userTrip': FieldValue.arrayRemove([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': qty,
          }
        ])
      });
      // await fetchCart();
      _cartItems.remove(productId);
      Fluttertoast.showToast(msg: "63".tr,
        backgroundColor: Colors.brown.shade600,
        textColor: Colors.white,
        fontSize: 16.0,);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearCartFromFirebase() async {
    final User? user = _auth.currentUser;
    try {
      await userstDb.doc(user!.uid).update({
        'userTrip': [],
      });
      // await fetchCart();
      _cartItems.clear();
      Fluttertoast.showToast(msg: '65'.tr,
        backgroundColor: Colors.brown.shade600,
        textColor: Colors.white,
        fontSize: 16.0,);
    } catch (e) {
      rethrow;
    }
  }

// Local
  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
          () => TripModel(
          cartId: const Uuid().v4(), productId: productId, quantity: 1),
    );
    notifyListeners();
  }

  void updateQty({required String productId, required int qty}) {
    _cartItems.update(
      productId,
          (cartItem) => TripModel(
        cartId: cartItem.cartId,
        productId: productId,
        quantity: qty,
      ),
    );
    notifyListeners();
  }

  bool isProdinCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  double getTotal({required HomeProvider productsProvider}) {
    double total = 0.0;
    return total;
  }

  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}*/