import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home/Home_page.dart';
import 'Error_Dialog.dart';
import 'Login.dart';

class RegisterAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerAuth({
    required String fullname,
    required String phoneno,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User registration successful, you can navigate to another page or perform other actions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SuccessSnackBarContent(successText: 'Registration Successful'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

      // Navigate to the login page after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      // Handle registration errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(errorText: 'Registration Error'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}

class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginAuth({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User login successful, you can navigate to another page or perform other actions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SuccessSnackBarContent(successText: 'Login Successful'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

      // Check if the login was successful, then navigate to the homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

    } catch (e) {
      // Handle login errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(errorText: 'Login Error'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      // You don't want to navigate to the homepage in case of an error
    }
  }
}

