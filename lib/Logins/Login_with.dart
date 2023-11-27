import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWiths extends StatelessWidget {
  final String imagePath;
  const LoginWiths({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(30),color: Colors.greenAccent),
      child: Image.asset(imagePath,height: 40,),
    );
  }
}
