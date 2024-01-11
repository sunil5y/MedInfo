import 'package:flutter/material.dart';
import 'Forgot_Password.dart';
import 'Login.dart';
import 'firebase_auth_services.dart';

// Define the Register widget
class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

// Define the state of the Register widget
class RegisterState extends State<Register> {
  // Variable for managing password visibility and instances of controllers
  bool passwordVisible = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Initialize the state
  @override
  void initState() {
    super.initState();
    // Set password visibility to true initially
    passwordVisible = true;
  }

  // Create an instance of RegisterAuthService for handling registration
  final RegisterAuthService _authService = RegisterAuthService();

  @override
  Widget build(BuildContext context) {
    // Create an instance of AuthService for handling Google sign-in
    AuthService authService = AuthService();

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
                  // Logo and Title
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                        child: Image.asset('assets/images/logo.png', height: 80)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  // Login and Register buttons
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        // Login button
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to the login page
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                "Login",
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
                        // Register button
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Do nothing or add any specific action
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                "Register",
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
                  // Full Name, Phone Number, Email, Password input fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        // Full Name input field
                        TextFormField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Phone Number input field
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            prefixIcon: Icon(Icons.call),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Email input field
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Password input field
                        TextFormField(
                          controller: passwordController,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Register button
                        TextButton(
                          onPressed: () async {
                            // Perform registration authentication
                            await _authService.registerAuth(
                              fullname: fullNameController.text,
                              phoneno: phoneNumberController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
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
                        SizedBox(height: 5),

                        // Or Register With text
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or Register With",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Google Sign-in button
                        TextButton(
                          onPressed: () async {
                            // Perform Google sign-in
                            await authService.handleSignIn();
                            // Navigate to the Login page
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Login()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Google Sign-in icon
                              LoginWiths(
                                  imagePath: "assets/images/google.png"),
                            ],
                          ),
                        )
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
