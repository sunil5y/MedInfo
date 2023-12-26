// MyCart.dart

import 'package:flutter/material.dart';
import '../Payment/Payment_page.dart';

class MyCart extends StatefulWidget {
  final List<CartItem> cartItems;

  MyCart({required this.cartItems});

  @override
  _MyCartState createState() => _MyCartState();
}

class CartItem {
  final String title;
  final String price;
  int quantity;

  CartItem({required this.title, required this.price, this.quantity = 1});
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Medicine Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/b.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              return buildCartItem(widget.cartItems[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCartItem(CartItem cartItem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentPage()),
        );
      },
      child: Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              Colors.lightBlue,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0.0, 0.9],
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset('assets/images/Tablet.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        cartItem.price,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -15,
              right: -10,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    widget.cartItems.remove(cartItem);
                  });
                },
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, size: 20,),
                      onPressed: () {
                        if (cartItem.quantity > 1) {
                          setState(() {
                            cartItem.quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      '${cartItem.quantity}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, size: 20,),
                      onPressed: () {
                        setState(() {
                          cartItem.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
