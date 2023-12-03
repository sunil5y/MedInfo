import 'package:flutter/material.dart';
import 'package:medinfo/Home/Home_page.dart';
import 'package:location/location.dart';

import '../Logins/Login.dart';
import 'Downloads.dart';
import 'Favourites.dart';
import 'Order_history.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('Profile Details'),
              SizedBox(height: 10),
              buildImage('assets/images/liquid.jpg'),
              SizedBox(height: 40),
              buildClickableContainer(Icons.my_library_books, 'Order History', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order_History()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.download, 'Downloads', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Downloads()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.favorite_border, 'Favourites', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.logout, 'Log Out', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  Widget buildContainer(IconData icon, String text) {
    return Container(
      width: double.infinity,
      decoration: buildContainerDecoration(),
      child: Row(
        children: [
          buildIconContainer(icon),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  Widget buildIconContainer(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget buildClickableContainer(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue, // Set the color you want when hovering
      child: buildContainer(icon, text),
    );
  }
}