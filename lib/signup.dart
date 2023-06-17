import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/login.dart';
import 'package:sample_project/studenthome.dart';
import 'package:sample_project/adminhome.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userType = 'Student'; // Default value

  List<String> userTypes = ['Student', 'Driver', 'Admin'];

  void handleSubmit() {
    if (userType == 'Student') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentHome()),
      );
    } else if (userType == 'Driver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentHome()),
      );
    } else if (userType == 'Admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Name : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 20,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
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
                  'User Type : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 20,
                  ),
                ),
                DropdownButton<String>(
                  value: userType,
                  onChanged: (String? newValue) {
                    setState(() {
                      userType = newValue!;
                    });
                  },
                  items:
                      userTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                  onPressed: handleSubmit,
                  child: Text('SUBMIT'),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            fontFamily: 'Arvo',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "Login ",
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
                              MaterialPageRoute(builder: (context) => Login()),
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
