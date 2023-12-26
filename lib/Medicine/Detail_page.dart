// DetailPage.dart

import 'package:flutter/material.dart';
import '../Cart/Cart_page.dart';
import '../Logins/Error_Dialog.dart';
import 'DatabaseService.dart';
import 'Medicine_page.dart';

class DetailPage extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();
  final MedicineFilter medicine;

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/Liquid.jpg',
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),

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
                          Row(
                            children: [
                              Text(
                                snapshot.data!['Title'],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 40),
                              Container(
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
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            snapshot.data!['Detail'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    } else {
                      return Text('No data available');
                    }
                  },
                ),

                SizedBox(height: 8),

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
                Expanded(
                  child: TabBarView(
                    children: [
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
                                Text(
                                  snapshot.data!['Usages'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
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
                                Text(
                                  snapshot.data!['Dosages'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
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
                                Text(
                                  snapshot.data!['Side Effects'],
                                  style: TextStyle(fontSize: 16),
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
                TextButton(
                  onPressed: () async {
                    Map<String, dynamic>? medicineData = await firebaseService.getMedicineDetailText(medicine.medicineId);

                    if (medicineData != null) {
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

