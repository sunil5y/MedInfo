import 'package:flutter/material.dart';
import 'firebase_auth_services.dart';
import 'Login.dart';

// Define the LoginWiths widget for displaying custom login buttons
class LoginWiths extends StatelessWidget {
  final String imagePath;
  const LoginWiths({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Container for custom login buttons
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
        color: Colors.cyan[50],
      ),
      child: Image.asset(imagePath, height: 40,),
    );
  }
}

// Define the Forgotpassword widget
class Forgotpassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotpasswordState();
  }
}

// Define the state of the Forgotpassword widget
class ForgotpasswordState extends State<Forgotpassword> {
  // Controller for email input
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/b.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                        child: Image.asset('assets/images/logo.png', height: 80)),
                  ),
                  SizedBox(height: 20),
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  // Email input field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Reset and Cancel buttons
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            children: [
                              // Reset button
                              Expanded(
                                child: TextButton(
                                  onPressed: () async {
                                    // Perform password reset
                                    await ForgotPasswordAuthService().resetPassword(
                                      email: emailController.text,
                                      context: context,
                                      newPassword: AutofillHints.newPassword,
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              // Cancel button
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    // Navigate to the Login page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
