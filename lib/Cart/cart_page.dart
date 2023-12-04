import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../Payment/Payment_page.dart';




class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  List<String> medicineName = ['Paracetamol', 'PanTop', 'Mozart',];
  List<String> medicineUnit = ['per pack', 'per pack', 'per pack',];
  List<int> medicinePrice = [50, 60, 70,];
  List<String> medicineImage = [
    'https://5.imimg.com/data5/SELLER/Default/2021/12/LK/ON/KX/43755673/paracetamol-500mg-tablet-500x500.jpg',
    'https://www.nepmeds.com.np/public/840-840/files/pantop-3-20200121171027-0uHvWE.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2021/12/LK/ON/KX/43755673/paracetamol-500mg-tablet-500x500.jpg',
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Cart'),
        centerTitle: true,
        actions: [
           Center(
            child: badges.Badge(
              badgeContent: Text('0', style: TextStyle(color: Colors.white),),
            /*  AnimationController controller = AnimationController(duration: const Duration(milliseconds: 300),
              vsync: this);
            animationDuration: Duration(milliseconds: 300),
            */

              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),


          SizedBox(width: 20)
        ], //actions
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: medicineName.length,
                itemBuilder: (context, index){
              return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(medicineImage[index].toString()),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(medicineName[index].toString(),
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(medicineUnit[index].toString() + " "+ r"NRS "+ medicinePrice[index].toString(),
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height:8),



                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Payment()),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            "Buy",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                );

            }
            ),

          )
        ],
      ),
    );
  }
}
