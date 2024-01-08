import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medinfo/Cart/Cart_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Logins/Error_Dialog.dart';
import 'Payment_page.dart';

class PaymentDatabase {
  final CollectionReference _paymentCollectionRef =
  FirebaseFirestore.instance.collection("PaymentDatabase");

  static Future<void> storePaymentDetails({
    required String itemTitle,
    required String totalItemCount,
    required String totalPriceString,
    required PaymentMethod selectedPaymentMethod,
    required TextEditingController paymentIdController,
    required TextEditingController deliveryAddressController,
    required TextEditingController phoneNumberController,
    required TextEditingController mpinController,
    required BuildContext context,
  }) async {
    // Validation
    if (itemTitle.isEmpty) {
      showErrorSnackBar(context, 'Item Title is empty');
      return;
    }

    if (totalItemCount.isEmpty) {
      showErrorSnackBar(context, 'Total Item Count is empty');
      return;
    }

    if (totalPriceString.isEmpty) {
      showErrorSnackBar(context, 'Total Price is empty');
      return;
    }

    if (paymentIdController.text.isEmpty) {
      showErrorSnackBar(context, 'Payment ID is empty');
      return;
    }

    if (deliveryAddressController.text.isEmpty) {
      showErrorSnackBar(context, 'Delivery Address is empty');
      return;
    }

    if (phoneNumberController.text.isEmpty) {
      showErrorSnackBar(context, 'Phone Number is empty');
      return;
    }

    if (mpinController.text.isEmpty) {
      showErrorSnackBar(context, 'MPIN is empty');
      return;
    }

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      var currentUser = auth.currentUser;

      if (currentUser != null) {
        DateTime currentDate = DateTime.now();
        String formattedDate =
            "${currentDate.year}-${currentDate.month}-${currentDate.day}";

        await FirebaseFirestore.instance.collection('PaymentDatabase').add({
          'UserId': currentUser.email,
          'ItemsTitle': itemTitle,
          'Items Total': totalItemCount,
          'Medicine Price': totalPriceString,
          'Delivery Charge': '10',
          'Total Cost': (double.parse(totalPriceString) + 10)
              .toStringAsFixed(2)
              .replaceAll(RegExp(r"([.]*00|0)$"), ""),
          'Selected Payment Method': selectedPaymentMethod
              .toString()
              .split('.')
              .last,
          '${selectedPaymentMethod
              .toString()
              .split('.')
              .last} ID': paymentIdController.text,
          'Delivery Address': deliveryAddressController.text,
          'Phone Number': phoneNumberController.text,
          'MPIN': mpinController.text,
          'Date': formattedDate,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 18),
              ),
            ),
            backgroundColor: Colors.green,
          ),
        );

        // Close the bottom sheet after storing details
        Navigator.pop(context);
      } else {
        print("User not logged in");
      }
    } catch (error) {
      print("Error storing payment details: $error");
    }
  }
}
