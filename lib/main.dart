import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Logins/Login.dart';

void main() async {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the provided configuration options
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyByLln293h6wGTlOvScp5wul5d6u1ZXJHE',
      authDomain: 'medinfo-project-d7837.firebaseapp.com',
      projectId: 'medinfo-project-d7837',
      storageBucket: 'medinfo-project-d7837.appspot.com',
      messagingSenderId: '86562656757',
      appId: '1:86562656757:android:400e8b134dd4e4fc21d0bc',
    ),
  );

  // Run the application with MyApp as the root widget
  runApp(const MyApp());
}

// Define the main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable the debug banner
      debugShowCheckedModeBanner: false,

      // Set the title of the application
      title: 'MedInfo',

      // Define the theme for the application
      theme: ThemeData(
        // Customize color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        // Enable Material 3 theming
        useMaterial3: true,
      ),

      // Set the initial screen to the login screen
      home: Login(),
    );
  }
}
