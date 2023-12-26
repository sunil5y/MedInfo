import 'package:flutter/material.dart';
import 'package:medinfo/Medicine/Detail_page.dart';
import 'package:medinfo/Medicine/Medicine_Categories.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';
import 'package:medinfo/Profile/Profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Cart/Cart_page.dart';
import 'Ads.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  static int selectedIndex = 0;
  onTappedBar(int value) {
    setState(() {
      selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  final PageController _pageController = PageController();
  homeitems(size) {

    final List<String> categoryImages = [
      'assets/images/Tablet.jpg',
      'assets/images/Liquid.jpg',
      'assets/images/Capsule.jpg',
    ];

    String getCategoryFromImagePath(String imagePath) {
      // Assuming the image path follows the format 'assets/images/{Category}.jpg'
      return imagePath.split('/').last.split('.').first;
    }

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/b.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 30),
                      child: Image.asset('assets/images/logo.png', height: 80),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 50),
                      child: const Text(
                        'Live Healthier',
                        style: TextStyle(
                            fontFamily: 'cursive',
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Colors.green
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: const Text(
                        'Explore Categories',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Medicine_Categories()    ,
                            ),
                          );
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.cyan[50],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicinePage(selectedCategory: getCategoryFromImagePath(categoryImages[index])),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    categoryImages[index],
                                    width: 120,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    categoryImages[index]
                                        .split('/')
                                        .last
                                        .split('.')
                                        .first, // Extracting title from the image path
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      width: 320, // Take the full width available
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightGreen,
                            Colors.lightBlue,
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [0.0, 0.9],
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      padding: EdgeInsets.all(8), // Adjust the padding as needed
                      child: Center(
                        child: const Text(
                          'Prioritizing Your Health',
                          style: TextStyle(
                            fontFamily: 'cursive',
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                Ads(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          homeitems(size),
          Medicine_Categories(),
          MyCart(cartItems: []),
          Profile(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.white,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.local_hospital),
          title: Text("Medicine"),
          selectedColor: Colors.white,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("Cart"),
          selectedColor: Colors.white,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.white,
        ),
      ],
        backgroundColor: Colors.green,
        onTap: onTappedBar,
        selectedItemColor: Colors.transparent,
        currentIndex: selectedIndex,),
    );
  }
}