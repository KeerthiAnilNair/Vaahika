import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/signup.dart';
import 'package:sample_project/studenthome.dart';
import 'package:sample_project/adminhome.dart';
import 'package:sample_project/driverhome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? userType; // Default value
   LocalStorage storage = LocalStorage('data');
  List<String> userTypes = ['Student', 'Driver', 'Admin'];
  String userName='';
  String password='';
  void handleSubmit() async{
    

    if (userType == 'Student') {
      var res=await http.post(Uri.parse("http://localhost:8000/student-login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': userName,
        'password': password
      }),);
      var userData=json.decode(res.body);
      print(userData);
      if(userData['status']=="ok"){
          storage.setItem('token',userData['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentHome()),
        );
      }
     
    } else if (userType == 'Driver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DriverHome()),
      );
    } else if (userType == 'Admin') {
      var res=await http.post(Uri.parse("http://localhost:8000/admin-login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': userName,
        'password': password
      }),);
      var userData=json.decode(res.body);
  
      if(userData['status']=="ok"){
          storage.setItem('token',userData['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      }
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
                  onChanged: (String newValue) {
                    setState(() {
                      userName = newValue;
                    });
                  },
                ),
                Text(
                  'User Type : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arvo',
                    fontSize: 20,
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: userType,
                  hint: Text('Select User Type'),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                  ),
                ),
                const Text(
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
                  onChanged: (String newValue) {
                    setState(() {
                      password = newValue;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: handleSubmit,
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
