import 'package:medinfo/Logins/Login_with.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}
class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Icon(Icons.lock,
                size: 100,),
              ),
            ),
            //image
            //Image.asset("assets/images/Logo.png")
            Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Text("Register", style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Login",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 24,
                          color: Colors.white),
                      ),
                      decoration:  BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Register",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 24,
                          color: Colors.black),
                      ),
                      decoration:  BoxDecoration(color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Full Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        prefixIcon:Icon(Icons.call)
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email Address",
                        prefixIcon:Icon(Icons.email)
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon:Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Register",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 24,
                          color: Colors.white),
                      ),
                      decoration:  BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("or Login With",style: TextStyle(
                        fontSize: 15
                    ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginWiths(imagePath:"assets/images/google.png"),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
