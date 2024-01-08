import 'package:flutter/material.dart';

import 'PaymentDatabase.dart';

// Enumeration representing different payment methods
enum PaymentMethod { Esewa, CashOnDelivery, Fonepay, CardOnDelivery }

// StatefulWidget for the PaymentPage
class PaymentPage extends StatefulWidget {
  final String itemTitle;
  final String totalPriceString;
  final int totalItemCount;

  // Constructor for the PaymentPage
  PaymentPage({
    required this.itemTitle,
    required this.totalPriceString,
    required this.totalItemCount,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

// State class for the PaymentPage
class _PaymentPageState extends State<PaymentPage> {
  // Variable to store the selected payment method
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
        elevation: 0,
      ),

      body: Container(
        // Container for the payment page
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Displaying the item title
                Text(
                  widget.itemTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                // Image container for the item
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
                      image: AssetImage('assets/images/Liquid.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                // Card displaying payment details
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
                          // Row displaying items total
                          Row(
                            children: [
                              Text(
                                'Items Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 125),
                              // Displaying the total item count
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                  widget.totalItemCount.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox for spacing
                          SizedBox(height: 15),
                          // Row displaying medicine price
                          Row(
                            children: [
                              Text(
                                'Medicine Price',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 100),
                              // Displaying the total price string
                              Text(
                                widget.totalPriceString,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox for spacing
                          SizedBox(height: 15),
                          // Row displaying delivery charge
                          Row(
                            children: [
                              Text(
                                'Delivery Charge',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 90),
                              // Displaying the fixed delivery charge (10)
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox for spacing
                          SizedBox(height: 15),
                          // Row displaying total cost
                          Row(
                            children: [
                              Text(
                                'Total Cost',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 135),
                              // Displaying the calculated total cost
                              Text(
                                (double.parse(widget.totalPriceString) + 10)
                                    .toStringAsFixed(2)
                                    .replaceAll(RegExp(r"([.]*00|0)$"), ""),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                // Text for choosing payment method
                Text(
                  'Choose Payment Method:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Radio buttons for payment methods
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
                // Second row of radio buttons for payment methods
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
                // SizedBox for spacing
                SizedBox(height: 10),
                // Elevated button for paying
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => PaymentBottomSheet(
                        selectedPaymentMethod: selectedPaymentMethod,
                        totalItemCount: widget.totalItemCount,
                        totalPriceString: widget.totalPriceString,
                        itemTitle: widget.itemTitle,
                      ),
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

// StatefulWidget for the PaymentBottomSheet
class PaymentBottomSheet extends StatefulWidget {
  final PaymentMethod selectedPaymentMethod;
  final int totalItemCount;
  final String totalPriceString;
  final String itemTitle;

  // Constructor for the PaymentBottomSheet
  PaymentBottomSheet({
    required this.selectedPaymentMethod,
    required this.totalItemCount,
    required this.totalPriceString,
    required this.itemTitle,
  });

  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

// State class for the PaymentBottomSheet
class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  // Text editing controllers for user input
  TextEditingController paymentIdController = TextEditingController();
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mpinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Container(
        // Container for the bottom sheet
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Row displaying the selected payment method
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Selected Payment Method:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.selectedPaymentMethod
                          .toString()
                          .split('.')
                          .last,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: Text(
                    '${widget.selectedPaymentMethod
                        .toString()
                        .split('.')
                        .last} ID',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: TextField(
                    controller: paymentIdController,
                    decoration: InputDecoration(
                      hintText: 'Enter ${widget.selectedPaymentMethod
                          .toString()
                          .split('.')
                          .last} ID',
                    ),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: Text(
                    'Delivery Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: TextField(
                    controller: deliveryAddressController,
                    decoration: InputDecoration(
                      hintText: 'Enter Delivery Address',
                    ),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                    ),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: Text(
                    'MPIN',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding for spacing
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: TextField(
                    controller: mpinController,
                    decoration: InputDecoration(
                      hintText: 'Enter MPIN',
                    ),
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    PaymentDatabase.storePaymentDetails(
                      itemTitle: widget.itemTitle,
                      totalItemCount: widget.totalItemCount.toString(),
                      totalPriceString: widget.totalPriceString,
                      selectedPaymentMethod: widget.selectedPaymentMethod,
                      paymentIdController: paymentIdController,
                      deliveryAddressController: deliveryAddressController,
                      phoneNumberController: phoneNumberController,
                      mpinController: mpinController,
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Confirm Payment', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}