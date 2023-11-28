import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  PageController pageController =PageController(viewportFraction: 0.85);
  int myslideIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffd9f2ef),
      child: Center(child:
        Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 2,
                onPageChanged: (value){
                  setState(() {
                    myslideIndex=value;
                  });

                },
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/ads1.png",
                      height: 250,fit: BoxFit.cover,),
                  ),
                );
              }
              ),
            ),
            SizedBox(height: 5,),

            SizedBox(
              height: 50,
              width: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index==myslideIndex?Colors.purple:Colors.grey,
                    ),

                  )
                );
              }
              ),
            )
          ],
        ),
      ),

    );
  }
}
