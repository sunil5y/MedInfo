import 'package:flutter/material.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';

class Medicine_Categories extends StatelessWidget {
  final List<String> categoryTitles = [
    'All',
    'Tablet',
    'Liquid',
    'Capsule',
    'Thermometer',
    'Syringe',
    'Spray',
    'Cream/Ointment',
  ];

  final List<String> categoryImages = [
    'assets/images/all.jpg',
    'assets/images/Tablet.jpg',
    'assets/images/Liquid.jpg',
    'assets/images/Capsule.jpg',
    'assets/images/thermometer.jpg',
    'assets/images/syringe.jpg',
    'assets/images/spray.jpg',
    'assets/images/cream.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicine Categories',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: categoryTitles.length,
          itemBuilder: (context, index) {
            return buildCategoryButton(context, categoryTitles[index], categoryImages[index]);
          },
        ),
      ),
    );
  }

  Widget buildCategoryButton(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicinePage(selectedCategory: title),
          ),
        );
      },
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
