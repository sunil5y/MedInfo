import 'package:flutter/material.dart';
import 'package:medinfo/Home/Home_page.dart';
import 'package:location/location.dart';

import '../Logins/Login.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}