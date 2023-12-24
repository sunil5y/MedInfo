import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medinfo/Home/Home_page.dart';

import '../Cart/cart_page.dart';
import '../Payment/Payment_page.dart';

class DetailPage extends StatelessWidget {
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
          elevation: 0, // Removes the shadow
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
                // Display the item image (replace 'item_image.jpg' with your actual image)
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
                // Display the item title
                Text(
                  'Paracetamol',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Display additional details about the item
                Text(
                  'Description of the item goes here. Provide information about the item, such as its features, specifications, etc.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 15),
                // Display other relevant information
                TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.medication,
                        color: Colors.deepPurple,
                      ),
                      text: 'Dosages',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.deepPurple,
                      ),
                      text: 'Side Effects',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.medical_services_outlined,
                        color: Colors.deepPurple,
                      ),
                      text: 'Precaution',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Expanded(
                    child: TabBarView(
                      children: [
                        // 1st Tab
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Dosage:\n',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      height: 2),
                                ),
                                TextSpan(
                                  text: 'Adults:\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                TextSpan(text: '500-1000 mg every 4-6 hours\n', style: TextStyle(color: Colors.black87)),
                                TextSpan(text: 'Max daily: 4000 mg\n'),
                                TextSpan(
                                  text: 'Children:\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      height: 2),
                                ),
                                TextSpan(text: 'Follow weight-based instructions\n'),
                                TextSpan(
                                    text: 'As directed by a healthcare professional\n'),
                                TextSpan(
                                    text: 'Avoid exceeding recommended doses'),
                              ],
                            ),
                          ),
                        ),
                        // 2nd Tab
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Side Effects:\n',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      height: 2),
                                ),
                                TextSpan(text: 'Diarrhea:\n'),
                                TextSpan(text: 'increased sweating\n'),
                                TextSpan(text: 'loss of appetite\n'),
                                TextSpan(text: 'nausea or vomiting\n'),
                                TextSpan(text: 'stomach cramps or pain\n'),
                                TextSpan(
                                    text: 'swelling or pain in the upper abdomen '),
                              ],
                            ),
                          ),
                        ),
                        // 3rd Tab
                        Container(
                          child: Center(
                            child: Text('3rd Tab'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add a button for further actions (e.g., Add to Cart)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart()),
                    );
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
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
