import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late Future<List<CartItem>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = _fetchCartItems();
  }

  Future<List<CartItem>> _fetchCartItems() async {
    // Fetch cart items from Firebase
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("CartItems")
        .doc(currentUser!.email)
        .collection("items")
        .get();

    // Convert the documents to CartItem objects
    List<CartItem> cartItems = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return CartItem(
        title: data['Title'],
        price: data['Price'],
        quantity: 1, // You can modify this based on your data
      );
    }).toList();

    return cartItems;
  }

  Future<void> _deleteCartItem(String title, String price) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;

      await FirebaseFirestore.instance
          .collection("CartItems")
          .doc(currentUser!.email)
          .collection("items")
          .where('Title', isEqualTo: title)
          .where('Price', isEqualTo: price)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });

      print("Removed from Cart");

      // Reload the page by popping and pushing a new instance
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyCart(cartItems: []), // You may need to pass the updated data
      ));
    } catch (error) {
      print("Error removing from Cart: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Medicine Cart',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
          child: FutureBuilder(
            future: _cartItems,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              // Use the retrieved cart items
              List<CartItem> cartItems = snapshot.data as List<CartItem>;

              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return buildCartItem(cartItems[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCartItem(CartItem cartItem) {
    // Extract numeric value from the price string
    double numericPrice = double.parse(cartItem.price.split(" ").last);

    // Calculate the total price based on quantity
    double totalPrice = numericPrice * cartItem.quantity;

    // Format the total price as a string without trailing ".0"
    String totalPriceString = totalPrice.toStringAsFixed(
        totalPrice.truncateToDouble() == totalPrice ? 0 : 2);

    return GestureDetector(
      onTap: () {
        int totalItemCount = calculateTotalItemCount([cartItem]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              itemTitle: cartItem.title,
              totalPriceString: totalPriceString,
              totalItemCount: totalItemCount,
            ),
          ),
        );
      },
      child: Container(
        height: 110,
        margin: EdgeInsets.only(left: 20, right: 10, top: 10),
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
                  height: 90,
                  width: 80,
                  margin: EdgeInsets.only(right: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/Liquid.jpg', fit: BoxFit.cover,)),
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
                        totalPriceString, // Use the calculated total price here
                        style: TextStyle(
                          fontSize: 16,
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
                    // Remove the item from the list and update the UI
                    _deleteCartItem(cartItem.title, cartItem.price);
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

  int calculateTotalItemCount(List<CartItem> cartItems) {
    int totalItemCount = 0;
    for (CartItem item in cartItems) {
      totalItemCount += item.quantity;
    }
    return totalItemCount;
  }
}
