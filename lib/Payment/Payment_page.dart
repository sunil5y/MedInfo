import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medinfo/Home/Home_page.dart';
import 'package:location/location.dart';


class Payment extends StatelessWidget {

  int _selectedIndex = 0;
  Location location = Location();
  LocationData? currentLocation;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Check Out' , style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold),),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // Display the item image (replace 'item_image.jpg' with your actual image)
              Image.asset(
                'assets/images/liquid.jpg',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              // Display the item title
              Text(
                'Items Total',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              // Display additional details about the item
              Text(
                'Delivery Charge',
                style: TextStyle(
                    fontSize: 15),
              ),

              SizedBox(height: 5),
              // Display additional details about the item
              Text(
                'Grand Total',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,),
              ),

              SizedBox(height: 20),

              // Delivery Address
              Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,),
              ),

              // Display the current location
              currentLocation != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Latitude: ${currentLocation!.latitude}'),
                  Text('Longitude: ${currentLocation!.longitude}'),
                ],
              )
                  : CircularProgressIndicator(),

              SizedBox(height: 20),

              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 40),

              SizedBox(height: 20),

              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,),
              ),

              SizedBox(height: 40),

              // Add a button for further actions (e.g., Add to Cart)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payment()),
                  );
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),

              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}