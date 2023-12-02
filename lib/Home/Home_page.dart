import 'package:flutter/material.dart';
import 'package:medinfo/Details/Detail_page.dart';
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

class HomePageState extends State<HomePage>{
  final List<String> categoryImages = [
    'Tablet',
    'Liquid',
    'Capsule',
    'Thermometer',
    'Syringe',
    'Spray',
    'Cream/Ointment',
  ];
  static int selectedIndex = 0;
  onTappedBar(int value) {
    setState(() {
      selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  final PageController _pageController = PageController();
  homeitems(size){
    return SingleChildScrollView(

      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/facebook.png', height: 50),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: const Text('Explore Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                    )

                  ],
                ),

                SizedBox(height: 5),

                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 110,
                        margin: EdgeInsets.all(8),
                        color: Colors.cyan[50],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // Example Image Widget
                            Image.asset(
                              'assets/images/thermometer.jpg', // Replace with your image URL
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
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
          DetailPage(),
          homeitems(size),
          MyCart(),
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
          icon: Icon(Icons.camera_alt, size: 40),
          selectedColor: Colors.black,
          title: Text(''),
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
        currentIndex: selectedIndex,),
    );
  }
}