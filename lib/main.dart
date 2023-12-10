import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medinfo/Cart/cart_page.dart';
import 'package:medinfo/Medicine/Detail_page.dart';
import 'package:medinfo/Home/Home_page.dart';
import 'package:medinfo/Medicine/Medicine_page.dart';
import 'package:medinfo/Payment/Payment_page.dart';
import 'package:medinfo/Profile/Profile_page.dart';

import 'Logins/Login.dart';
import 'Medicine/Medicine_Categories.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedInfo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
