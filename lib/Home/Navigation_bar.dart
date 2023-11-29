import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


import 'Home_page.dart';

class Navigation_bar extends StatefulWidget {
  const Navigation_bar({Key? key}) : super(key: key);

  @override
  State<Navigation_bar> createState() => _Navigation_bar();
}

class _Navigation_bar extends State<Navigation_bar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: Colors.lightBlue,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blue.shade900,
              padding: EdgeInsets.all(8),
              gap: 20,
              tabs: [
                GButton(
                    icon: Icons.home,
                    text: 'Home'),

                GButton(
                    icon: Icons.shop,
                    text: 'Cart'),

                GButton(
                    icon: Icons.search,
                    text: 'Search'),

                GButton(
                    icon: Icons.person,
                    text: 'Profile'),
              ]

          ),
        ),
      ),
    );
  }
}
