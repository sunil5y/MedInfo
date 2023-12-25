
import 'package:flutter/material.dart';
import '../Home/Home_page.dart';
import 'Login_with.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
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
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
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
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                      () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                          ),

                        ),
                        SizedBox(height: 20.0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
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
                                  color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or Login With",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoginWiths(imagePath: "assets/images/google.png"),
                          ],
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



// import 'package:medinfo/Home/Home_page.dart';
// import 'package:medinfo/Logins/Login_with.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'Register.dart';
//
// class Login extends StatelessWidget {
//   bool obscureTexts = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyan[50],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //image
//             //Image.asset("assets/images/Logo.png")
//             Padding(
//               padding: const EdgeInsets.only(top: 200),
//               child: Center(
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Login()),
//                       );
//                     },
//                     child: Container(
//                       width: 150,
//                       height: 50,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                             color: Colors.white),
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Register()),
//                       );
//                     },
//                     child: Container(
//                       width: 150,
//                       height: 50,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Register",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                             color: Colors.black),
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                         hintText: "Email Address",
//                         prefixIcon: Icon(Icons.email)),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   TextFormField(
//                     obscureText: !obscureTexts,
//                     decoration: InputDecoration(
//                         hintText: "Password",
//                         prefixIcon: Icon(Icons.lock),
//                         suffixIcon: Icon(obscureTexts
//                             ? Icons.visibility_off
//                             : Icons.visibility_off)),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Text(
//                       "Forgot Passowrd?",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     },
//                     child: Container(
//                       height: 50,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                             color: Colors.white),
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "or Login With",
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       LoginWiths(imagePath: "assets/images/google.png"),
//
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
