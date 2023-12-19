import 'package:flutter/material.dart';
import 'package:medinfo/Medicine/Detail_page.dart';
import 'package:medinfo/Medicine/Medicine_Categories.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';
import 'package:medinfo/Profile/Profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Cart/cart_page.dart';
import 'Ads.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<String> categoryImages = [
    'Tablet',
    'Liquid',
    'Capsule',
  ];
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
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: Image.asset('assets/images/facebook.png', height: 50),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      hintText: 'Search...',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 235.0),
                      child: const Text(
                        'Explore Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 110,
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
                                builder: (context) => DetailPage(),
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
          MyCart(),
          Profile(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: [
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
        backgroundColor: Colors.blue,
        onTap: onTappedBar,
        selectedItemColor: Colors.transparent,
        currentIndex: selectedIndex,
      ),
    );
  }
}
