import 'package:flutter/material.dart';
import 'package:medinfo/Cart/cart_page.dart';
import 'package:medinfo/Details/Detail_page.dart';

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
                  padding: const EdgeInsets.only(top: 15),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
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
                SizedBox(height: 50,),
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
          MyCart(),
          homeitems(size),
          homeitems(size),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shop',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.deepOrange,
        ),
      ],
        onTap: onTappedBar,
        // selectedItemColor: Colors.orange,
        currentIndex: selectedIndex,),
    );
  }
}