import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum PaymentMethod { Esewa, CashOnDelivery, Fonepay, CardOnDelivery }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod selectedPaymentMethod = PaymentMethod.Esewa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0, // Removes the shadow
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Paracetamol Text
                Text(
                  'Paracetamol',  // Add the text you want
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightGreen,
                        Colors.lightBlue,
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [0.0, 0.9],
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Liquid.jpg'), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Items Total',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Delivery Charge',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Grand Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  'Choose Payment Method:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<PaymentMethod>(
                        title: Text('Esewa'),
                        value: PaymentMethod.Esewa,
                        groupValue: selectedPaymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<PaymentMethod>(
                        title: Text('Cash On Delivery'),
                        value: PaymentMethod.CashOnDelivery,
                        groupValue: selectedPaymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<PaymentMethod>(
                        title: Text('Fonepay'),
                        value: PaymentMethod.Fonepay,
                        groupValue: selectedPaymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<PaymentMethod>(
                        title: Text('Card On Delivery'),
                        value: PaymentMethod.CardOnDelivery,
                        groupValue: selectedPaymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => PaymentBottomSheet(selectedPaymentMethod),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Pay Now', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentBottomSheet extends StatelessWidget {
  final PaymentMethod selectedPaymentMethod;

  PaymentBottomSheet(this.selectedPaymentMethod);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/b.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selected Payment Method:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              selectedPaymentMethod.toString().split('.').last,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 15),

            Text(
              '${selectedPaymentMethod.toString().split('.').last} ID',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                ),
              ),
            ),

            SizedBox(height:10),

            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '', 
                ),
              ),
            ),

            SizedBox(height:10),

            Text(
              'Phone Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                ),
              ),
            ),

            SizedBox(height:10),

            Text(
              'MPIN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text('Payment Successful!', style: TextStyle(fontSize: 18))),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Confirm Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
