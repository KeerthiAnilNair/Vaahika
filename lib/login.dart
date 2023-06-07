import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/signup.dart';
import 'package:sample_project/studenthome.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Vaahika',
                  style: TextStyle(
                      fontFamily: 'LakkiReddy',
                      fontSize: 48,
                      color: Colors.blue[800]),
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Username : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 20,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Username',
                  ),
                ),
                Text(
                  'Password : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 20,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentHome()),
                    );
                  },
                  child: Text('SUBMIT'),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            fontFamily: 'Arvo',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "Sign Up ",
                        style: TextStyle(
                          fontFamily: 'Arvo',
                          fontSize: 16,
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
