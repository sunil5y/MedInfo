import 'package:flutter/material.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';

// This class represents a page displaying different medicine categories
class Medicine_Categories extends StatelessWidget {
  // List of category titles
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

  // List of image paths corresponding to each category
  final List<String> categoryImages = [
    'assets/images/all.jpg',
    'assets/images/Tablet.jpg',
    'assets/images/Liquid.jpg',
    'assets/images/Capsule.jpg',
    'assets/images/thermometer.jpg',
    'assets/images/Syringe.jpg',
    'assets/images/spray.jpg',
    'assets/images/cream.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicine Categories',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/b.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: categoryTitles.length,
              itemBuilder: (context, index) {
                // Build a button for each category
                return buildCategoryButton(context, categoryTitles[index], categoryImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Builds a button for a specific medicine category
  Widget buildCategoryButton(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page (MedicinePage) with the selected category
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
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
