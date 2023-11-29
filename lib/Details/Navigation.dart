import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation_bar extends StatefulWidget {
  const Navigation_bar({Key? key}) : super(key: key);

  @override
  State<Navigation_bar> createState() => _Navigation_bar();
}

class _Navigation_bar extends State<Navigation_bar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

          items:const[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
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


          ]
      ),
    );
  }
}