import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Cart/CartDatabase.dart';
import '../Cart/Cart_page.dart';
import '../Logins/Error_Dialog.dart';
import 'DatabaseService.dart';
import 'Medicine_page.dart';

// A screen displaying detailed information about a specific medicine
class DetailPage extends StatelessWidget {
  // Instances for interacting with Firebase and Cart
  final FirebaseService firebaseService = FirebaseService();
  final CartService cartService = CartService();

  // The medicine for which details are displayed
  final MedicineFilter medicine;

  // Constructor to initialize the DetailPage with a specific medicine
  DetailPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Medicine Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/b.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Displaying medicine image
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Liquid.jpg',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Displaying medicine details fetched from Firebase
                FutureBuilder<Map<String, dynamic>?>(
                  future: firebaseService.getMedicineDetailText(medicine.medicineId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Medicine title and price
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  snapshot.data!['Title'],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 40),
                              Expanded(
                                child: Container(
                                  height: 30,
                                  width: 145,
                                  alignment: Alignment.center,
                                  child: Text(
                                    snapshot.data!['Price'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),

                          // Medicine details
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              snapshot.data!['Detail'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text('No data available');
                    }
                  },
                ),

                SizedBox(height: 8),

                // TabBar for navigating between Usages, Dosages, and Side Effects
                TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.deepPurple,
                      ),
                      text: 'Usages',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.medication,
                        color: Colors.deepPurple,
                      ),
                      text: 'Dosages',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.health_and_safety,
                        color: Colors.deepPurple,
                      ),
                      text: 'Side Effects',
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // TabBarView to display content corresponding to selected tab
                Expanded(
                  child: TabBarView(
                    children: [
                      // Usages tab
                      FutureBuilder<Map<String, dynamic>?>(
                        future: firebaseService.getMedicineDetailText(medicine.medicineId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data!['Usages'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),

                      // Dosages tab
                      FutureBuilder<Map<String, dynamic>?>(
                        future: firebaseService.getMedicineDetailText(medicine.medicineId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data!['Dosages'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),

                      // Side Effects tab
                      FutureBuilder<Map<String, dynamic>?>(
                        future: firebaseService.getMedicineDetailText(medicine.medicineId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data!['Side Effects'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
                    ],
                  ),
                ),

                // Button to add medicine to the cart
                TextButton(
                  onPressed: () async {
                    // Retrieve medicine details from Firebase
                    Map<String, dynamic>? medicineData = await firebaseService.getMedicineDetailText(medicine.medicineId);

                    // Add the medicine to the cart
                    await cartService.addToCart(
                      medicineData?['Title'] ?? 'Default Title',
                      medicineData?['Price'] ?? 'Default Price',
                    );

                    if (medicineData != null) {
                      // Navigate to the Cart page with the added item
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyCart(
                            cartItems: [
                              CartItem(
                                title: medicineData['Title'] ?? 'Default Title',
                                price: medicineData['Price'] ?? 'Default Price',
                              ),
                              // Add other cart items as needed
                            ],
                          ),
                        ),
                      );

                      // Display a success Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: SuccessSnackBarContent(successText: 'Successfully Added to Cart'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                    } else {
                      print('Medicine data is null');
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
