// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:medinfo/Medicine/Detail_page.dart';
import 'package:medinfo/Medicine/Medicine_Categories.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';
import 'package:medinfo/Profile/Profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Cart/Cart_page.dart';
import 'Ads.dart';

// Home page widget
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // Create and return the state for the home page
    return HomePageState();
  }
}

// Home page state
class HomePageState extends State<HomePage> {
  // Static variable to track the selected bottom navigation bar item index
  static int selectedIndex = 0;

  // Method to handle bottom navigation bar item tap
  onTappedBar(int value) {
    setState(() {
      selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  // Controller for managing pages in the PageView
  final PageController _pageController = PageController();

  // Widget for displaying home page content
  homeitems(size) {
    // List of category images
    final List<String> categoryImages = [
      'assets/images/Tablet.jpg',
      'assets/images/Liquid.jpg',
      'assets/images/Capsule.jpg',
    ];

    // Method to extract category name from the image path
    String getCategoryFromImagePath(String imagePath) {
      return imagePath.split('/').last.split('.').first;
    }

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/images/b.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                // Logo and title
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 50),
                      child: Image.asset('assets/images/logo.png', height: 80),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 50),
                      child: const Text(
                        'Live Healthier',
                        style: TextStyle(
                          fontFamily: 'cursive',
                          fontSize: 45,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Explore categories text and View All link
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: const Text(
                        'Explore Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to Medicine Categories page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Medicine_Categories(),
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
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Horizontal list of category items
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
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
                                // Navigate to Medicine Page with selected category
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MedicinePage(
                                      selectedCategory: getCategoryFromImagePath(categoryImages[index]),
                                    ),
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
                                      getCategoryFromImagePath(categoryImages[index]),
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
                ),
                SizedBox(height: 10),
                // Prioritizing Your Health gradient text
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      width: 320,
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
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(8),
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
                SizedBox(height: 10),
                // Ads widget
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
      // PageView for handling different pages
      body: PageView(
        controller: _pageController,
        children: [
          // Home page content
          homeitems(size),
          // Medicine Categories page
          Medicine_Categories(),
          // Cart page
          MyCart(cartItems: []),
          // Profile page
          Profile(),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: SalomonBottomBar(
        items: [
          // Home bottom navigation item
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.white,
          ),
          // Medicine bottom navigation item
          SalomonBottomBarItem(
            icon: Icon(Icons.local_hospital),
            title: Text("Medicine"),
            selectedColor: Colors.white,
          ),
          // Cart bottom navigation item
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            selectedColor: Colors.white,
          ),
          // Profile bottom navigation item
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.white,
          ),
        ],
        backgroundColor: Colors.green,
        onTap: onTappedBar,
        selectedItemColor: Colors.transparent,
        currentIndex: selectedIndex,
      ),
    );
  }
}
