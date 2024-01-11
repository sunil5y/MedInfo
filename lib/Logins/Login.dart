import 'package:flutter/material.dart';
import 'firebase_auth_services.dart';
import 'package:medinfo/Home/Home_page.dart';
import 'package:medinfo/Logins/Forgot_Password.dart';
import 'package:medinfo/Logins/Register.dart';

// Define the Login widget
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

// Define the state of the Login widget
class LoginState extends State<Login> {
  // Create an instance of LoginAuthService for handling authentication
  final LoginAuthService _authService = LoginAuthService();

  // Variables for managing password visibility and controllers for text fields
  bool obscureTexts = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                        child: Image.asset('assets/images/logo.png', height: 80)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: Text(
                        "Login",
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
                              // Action to perform when the login button is pressed
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
                              // Navigate to the Register screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Register()),
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
                  // Email and Password input fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
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
                          obscureText: !obscureTexts,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(obscureTexts
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  obscureTexts = !obscureTexts;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),

                        // Forgot Password link
                        Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the Forgot Password screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgotpassword(),
                                ),
                              );
                            },
                            child: const Align(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),

                        // Login button
                        TextButton(
                          onPressed: () async {
                            // Perform login authentication
                            await _authService.loginAuth(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
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
                        SizedBox(height: 5),

                        // Or Login With text
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or Login With",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Google Sign-in button
                        TextButton(
                          onPressed: () async {
                            // Perform Google sign-in
                            await authService.handleSignIn();
                            // Navigate to the Home page
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Google Sign-in icon
                              LoginWiths(imagePath: "assets/images/google.png"),
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
