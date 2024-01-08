import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class Order_History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Order History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: buildBackgroundContainer(OrderHistoryList()),
      ),
    );
  }

  Widget buildBackgroundContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/b.jpg'), // Set your image asset path
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class OrderHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('PaymentDatabase').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Data is ready
        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        // Convert documents to your custom model (adjust it based on your model)
        List<OrderHistoryItem> orderHistoryItems = documents.map((doc) {
          return OrderHistoryItem.fromDocument(doc);
        }).toList();

        return ListView.builder(
          itemCount: orderHistoryItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, top: 5, right: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.transparent, // Set the card color to transparent
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightGreen,
                        Colors.lightBlue,
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [0.0, 0.9],
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      orderHistoryItems[index].OrderId,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      orderHistoryItems[index].itemsTotal,
                      style: TextStyle(color: Colors.white),
                    ),
                    // Add more details based on your model
                    onTap: () {
                      showDetailsDialog(context, orderHistoryItems[index]);
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showDetailsDialog(BuildContext context, OrderHistoryItem orderHistoryItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightGreen,
          title: Text('Order Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medicine: ${orderHistoryItem.OrderId}'),
                Text('Total Items: ${orderHistoryItem.Itemstotal}'),
                Text('Payment Method: ${orderHistoryItem.Paymentmethod}'),
                Text('Medicine Price: ${orderHistoryItem.medicineprice}'),
                Text('Total Cost: ${orderHistoryItem.itemsTotal}'),
                Text('Order Date: ${orderHistoryItem.formattedOrderDate}'), // Use the formatted date
                // Add more details based on your model
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class OrderHistoryItem {
  final String OrderId;
  final String Itemstotal;
  final String Paymentmethod;
  final String itemsTotal;
  final String medicineprice;
  final DateTime orderDate; // Change the name to orderDate
  // Add more fields based on your Firebase document structure

  OrderHistoryItem({
    required this.OrderId,
    required this.Itemstotal,
    required this.Paymentmethod,
    required this.itemsTotal,
    required this.medicineprice,
    required this.orderDate, // Change the name to orderDate
    // Initialize other fields here
  });

  // Factory method to create an OrderHistoryItem from a Firestore document
  factory OrderHistoryItem.fromDocument(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    DateTime? orderDate;

    // Check if 'Date' is a Timestamp
    if (data['Date'] is Timestamp) {
      orderDate = (data['Date'] as Timestamp).toDate();
    } else if (data['Date'] is String) {
      // Check if 'Date' is a String and parse it
      try {
        // Attempt to parse the date using a specific format
        orderDate = DateFormat('yyyy-MM-dd').parse(data['Date']);
      } catch (e) {
        // Handle parsing error, use current date as a fallback
        print('Error parsing date: $e');
        orderDate = DateTime.now();
      }
    }

    return OrderHistoryItem(
      OrderId: data['ItemsTitle'],
      Itemstotal: data['Items Total'],
      Paymentmethod: data['Selected Payment Method'],
      medicineprice: data['Medicine Price'],
      itemsTotal: data['Total Cost'],
      orderDate: orderDate ?? DateTime.now(),
      // Map other fields here
    );
  }





  // Getter to retrieve the formatted date as a string
  String get formattedOrderDate {
    if (orderDate != null) {
      // Format DateTime as a string
      return DateFormat.yMd().format(orderDate);
    } else {
      return '';
    }
  }
}
