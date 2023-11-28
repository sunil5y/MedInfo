import 'package:flutter/material.dart';

import 'Ads.dart';
import 'Navigation_bar.dart';

class HomePage extends StatelessWidget {
  final List<String> categoryImages = [
    'Tablet',
    'Liquid',
    'Capsule',
    'Thermometer',
    'Syringe',
    'Spray',
    'Cream/Ointment',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png', // Replace with your background image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
       Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search...',

                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Explore Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    width: 110,
                    margin: EdgeInsets.all(8),
                    color: Color(0xffd9f2ef),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Example Image Widget

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png', // Replace with your image URL
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),

                        // Example Heading Text
                        SizedBox(height: 8),
                        Text(
                          categoryImages[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            Ads(),
            Navigation_bar(),
          ],
        ),
        ],
      ),
    );
  }
}
