// Import necessary packages and files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Home/Home_page.dart';
import 'Error_Dialog.dart';
import 'Login.dart';

// Class responsible for user registration authentication
class RegisterAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerAuth({
    required String fullname,
    required String phoneno,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    // Validation checks for empty fields
    if (fullname.isEmpty && phoneno.isEmpty && email.isEmpty && password.isEmpty) {
      showErrorSnackBar(context, 'All fields are empty');
      return;
    }

    // Individual field validations
    if (fullname.isEmpty) {
      showErrorSnackBar(context, 'Full name field is empty');
      return;
    }

    if (phoneno.isEmpty) {
      showErrorSnackBar(context, 'Phone number field is empty');
      return;
    }

    if (email.isEmpty) {
      showErrorSnackBar(context, 'Email field is empty');
      return;
    }

    if (password.isEmpty) {
      showErrorSnackBar(context, 'Password field is empty');
      return;
    }

    try {
      // Create a new user using Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user information in Firestore
      await _firestore.collection('User').doc(userCredential.user?.uid).set({
        'fullname': fullname,
        'phoneno': phoneno,
        'email': email,
        'password': password,
      });

      // Show success message and navigate to login page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SuccessSnackBarContent(successText: 'Registration Successful'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      // Handle registration errors
      String errorMessage = 'Registration Error';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? 'An error occurred during registration.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(errorText: errorMessage),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}

// Class responsible for user login authentication
class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginAuth({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Validation checks for empty fields
      if (email.isEmpty && password.isEmpty) {
        throw FirebaseAuthException(
          code: 'empty-fields',
          message: 'All fields are empty.',
        );
      }

      // Individual field validations
      if (email.isEmpty) {
        throw FirebaseAuthException(
          code: 'empty-email',
          message: 'Email field cannot be empty.',
        );
      }

      if (password.isEmpty) {
        throw FirebaseAuthException(
          code: 'empty-password',
          message: 'Password field cannot be empty.',
        );
      }

      // Sign in user using Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success message and navigate to home page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SuccessSnackBarContent(successText: 'Login Successful'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle login errors

      String errorMessage = 'Login Error';
      if (e.code == 'empty-fields') {
        errorMessage = 'All fields are empty.';
      } else if (e.code == 'empty-email') {
        errorMessage = 'Email field cannot be empty.';
      } else if (e.code == 'empty-password') {
        errorMessage = 'Password field cannot be empty.';
      } else {
        errorMessage = e.message ?? '';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(errorText: errorMessage),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      // You don't want to navigate to the homepage in case of an error
    }
  }
}

// Class responsible for handling password reset functionality
class ForgotPasswordAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
    required String newPassword,
  }) async {
    try {
      // Send a password reset email
      await _auth.sendPasswordResetEmail(email: email);

      // Display a success message or navigate to a success screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent. Check your email.'),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      // Handle errors
      String errorMessage = 'Error';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? 'An error occurred during changes.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

// Class responsible for general authentication, especially Google Sign-In
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =GoogleSignIn();

  // Method to handle Google Sign-In
  Future<void> handleSignIn() async{
    try{
      // Sign in with Google
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if(googleUser!=null){
        GoogleSignInAuthentication googleAuth =await googleUser.authentication;
        AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    }catch(e){
      // Handle Google Sign-In errors
      print("Error signing in with Google $e");
    }
  }
}
