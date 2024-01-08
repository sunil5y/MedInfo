import 'package:flutter/material.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  // Use a PageController to control the PageView
  PageController pageController = PageController(viewportFraction: 0.85);

  // Track the current index of the PageView for indicator dots
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // PageView for displaying ads
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: 2,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController, // Pass the controller to the PageView
              itemBuilder: (context, index) {
                // Use a switch statement to load different images based on the index
                String imagePath = index == 0
                    ? "assets/images/ads1.jpg"
                    : "assets/images/ads2.png";

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          // Indicator dots for tracking the current ad
          SizedBox(
            height: 20, // Adjusted height of the indicator dots container
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 10, // Adjusted height of each indicator dot
                    width: 10, // Adjusted width of each indicator dot
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: index == currentIndex ? Colors.purple : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
