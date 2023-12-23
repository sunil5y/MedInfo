import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../Payment/Payment_page.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<String> medicineName = [
    'Paracetamol',
    'Niko',
    'Gaviscon',
    'Vicks',
    'Amoxycillin',
    'Doxysina',
  ];
  List<String> medicineUnit = [
    'per pack',
    'per pack',
    'per vial',
    'per vial',
    'per pack',
    'per pack',
  ];
  List<int> medicinePrice = [50, 60, 70, 125, 90, 100, 70];
  List<String> medicineImage = [
    'https://5.imimg.com/data5/SELLER/Default/2021/12/LK/ON/KX/43755673/paracetamol-500mg-tablet-500x500.jpg',
    'https://www.nepmeds.com.np/public/840-840/files/niko-2-20200123085326-fqGDx6.jpg',
    'https://m.media-amazon.com/images/I/71XQpicHikL._AC_SL1500_.jpg',
    'https://i.ebayimg.com/images/g/ZscAAOSw9IFkO6QI/s-l500.jpg',
    'https://m.media-amazon.com/images/I/41-bx-fCENL._SY466_.jpg',
    'https://i0.wp.com/www.lifesaverpharma.com/wp-content/uploads/2021/08/doxysina.jpg?fit=600%2C399&ssl=1',
  ];
  List<int> quantities = List.filled(6, 1);

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decreaseQuantity(int index) {
    if (quantities[index] > 1) {
      setState(() {
        quantities[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Cart'),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        itemCount: medicineName.length,
        itemBuilder: (context, index) {
          return buildMedicineCard(index);
        },
      ),
    );
  }

  Widget buildMedicineCard(int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMedicineImage(index),
            SizedBox(width: 10),
            Expanded(
              child: buildMedicineDetails(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMedicineImage(int index) {
    return Container(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          medicineImage[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildMedicineDetails(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          medicineName[index],
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        Text(
          '${medicineUnit[index]} NRS ${medicinePrice[index]}',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        buildQuantityAndBuyButton(index),
      ],
    );
  }

  Widget buildQuantityAndBuyButton(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildQuantityContainer(index),
        buildBuyButton(index),
      ],
    );
  }

  Widget buildQuantityContainer(int index) {
    return Container(
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: Colors.white),
            onPressed: () => decreaseQuantity(index),
          ),
          Text(
            quantities[index].toString(),
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () => increaseQuantity(index),
          ),
        ],
      ),
    );
  }

  Widget buildBuyButton(int index) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentPage()),
        );
      },
      child: Text("Buy"),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
    );
  }
}
