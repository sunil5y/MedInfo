import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection("CartItems");

  Future addToCart(String title, String price) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;

      await _userCollectionRef
          .doc(currentUser!.email)
          .collection("items")
          .add({
        'Title': title,
        'Price': price,
      });

      print("Added to Cart");
    } catch (error) {
      print("Error adding to Cart: $error");
    }
  }

  Future<void> _deleteCartItem(String title, String price) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;

      await FirebaseFirestore.instance
          .collection("CartItems")
          .doc(currentUser!.email)
          .collection("items")
          .where('Title', isEqualTo: title)
          .where('Price', isEqualTo: price)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });

      print("Removed from Cart");
    } catch (error) {
      print("Error removing from Cart: $error");
    }
  }

}


/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Payment_page.dart';

class PaymentDatabase {

  final CollectionReference _paymentCollectionRef = FirebaseFirestore.instance.collection("PaymentDatabase");

  static Future<void> storePaymentDetails({
    required String totalItemCount,
    required String totalPriceString,
    required PaymentMethod selectedPaymentMethod,
    required TextEditingController paymentIdController,
    required TextEditingController deliveryAddressController,
    required TextEditingController phoneNumberController,
    required TextEditingController mpinController,
    required BuildContext context,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      var currentUser = auth.currentUser;

      if (currentUser != null) {
        await FirebaseFirestore.instance.collection('PaymentDatabase').add({
          'UserId': currentUser.email,
          'Items Total': totalItemCount,
          'Medicine Price': totalPriceString,
          'Delivery Charge': '10',
          'Total Cost': (double.parse(totalPriceString) + 10).toStringAsFixed(2).replaceAll(RegExp(r"([.]*00|0)$"), ""),
          'Selected Payment Method': selectedPaymentMethod.toString().split('.').last,
          '${selectedPaymentMethod.toString().split('.').last} ID': paymentIdController.text,
          'Delivery Address': deliveryAddressController.text,
          'Phone Number': phoneNumberController.text,
          'MPIN': mpinController.text,
        });

        print("Payment details stored successfully");
        Navigator.pop(context); // Close the bottom sheet after storing details
      } else {
        print("User not logged in");
      }
    } catch (error) {
      print("Error storing payment details: $error");
    }
  }
}

 */
