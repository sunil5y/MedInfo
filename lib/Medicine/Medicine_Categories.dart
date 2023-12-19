import 'package:flutter/material.dart';

class Medicine_Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Medicine Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: [
            _buildCategoryButton('Tablet', 'assets/images/tablet.jpg'),
            _buildCategoryButton('Liquid', 'assets/images/liquid1.jpg'),
            _buildCategoryButton('Capsule', 'assets/images/capsule.jpg'),
            _buildCategoryButton('Thermometer', 'assets/images/thermometer.jpg'),
            _buildCategoryButton('Syringe', 'assets/images/syringe.jpg'),
            _buildCategoryButton('Spray', 'assets/images/spray.jpg'),
            _buildCategoryButton('Cream/Ointment', 'assets/images/cream.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

