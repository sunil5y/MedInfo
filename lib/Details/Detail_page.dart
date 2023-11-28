import 'package:flutter/material.dart';



class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the item image (replace 'item_image.jpg' with your actual image)
            Image.asset(
              'assets/images/facebook.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            // Display the item title
            Text(
              'Paracetamol',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Display additional details about the item
            Text(
              'Description of the item goes here. Provide information about the item, such as its features, specifications, etc.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Display other relevant information
            Text(
              'Price: \$99.99',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'In Stock: 10 units',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(height: 16),
            // Add a button for further actions (e.g., Add to Cart)
            ElevatedButton(
              onPressed: () {
                // Implement the action when the button is pressed
                // (e.g., adding the item to the cart)
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}