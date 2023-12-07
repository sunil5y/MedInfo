import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum PaymentMethod { esewa, cashOnDelivery, fonepay, cardOnDelivery }

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
  PaymentMethod selectedPaymentMethod = PaymentMethod.esewa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Payment', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$100.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Items Total',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Delivery Charge',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Grand Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                      value: PaymentMethod.esewa,
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
                      value: PaymentMethod.cashOnDelivery,
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
                      value: PaymentMethod.fonepay,
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
                      value: PaymentMethod.cardOnDelivery,
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
                  // Implement your payment logic here
                  // For this example, show a bottom sheet
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => PaymentBottomSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set the background color to green
                ),
                child: Text('Pay Now', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$100.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
