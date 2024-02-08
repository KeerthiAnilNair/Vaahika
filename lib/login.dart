// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

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
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? userType; // Default value
  LocalStorage storage = LocalStorage('data');
  List<String> userTypes = ['Student', 'Driver', 'Admin'];
  String userName = '';
  String password = '';
  // void handleSubmit() async {
  //   if (userType == 'Student') {
  //     var res = await http.post(
  //         Uri.parse("http://localhost:8000/student-login"),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(
  //             <String, String>{'userName': userName, 'password': password}));
  //     var userData = json.decode(res.body);
  //     print(userData);
  //     if (userData['status'] == "ok") {
  //       storage.setItem('token', userData['token']);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => StudentHome()),
  //       );
  //     } else {
  //       print(userData['msg']);
  //     }
  //   } else if (userType == 'Driver') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => DriverHome()),
  //     );
  //   } else if (userType == 'Admin') {
  //     var res = await http.post(Uri.parse("http://localhost:8000/admin-login"),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(
  //             <String, String>{'email': userName, 'password': password}));
  //     var userData = json.decode(res.body);

  //     if (userData['status'] == "ok") {
  //       storage.setItem('token', userData['token']);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => AdminHome()),
  //       );
  //     }
  //   }
  // }

  void handleSubmit() async {
    if (userType == 'Student') {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => StudentHome()));
    } else if (userType == 'Admin') {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminHome()));
    } else {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => DriverHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: width100 * 0.9,
              height: height100 * 0.6,
              child: Card(
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
                    Container(
                      width: width100 * 0.7,
                      child: CustomDropdown<String>(
                          decoration: CustomDropdownDecoration(
                            closedBorder:
                                Border.all(color: Colors.grey, width: 1.25),
                            expandedBorder:
                                Border.all(color: Colors.grey, width: 1.25),
                          ),
                          hintText: 'Select User Type',
                          hintBuilder: (context, hint) {
                            return Row(
                              children: [
                                Text(
                                  hint,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: width100 * 0.038),
                                ),
                              ],
                            );
                          },
                          listItemBuilder:
                              (context, item, isSelected, onItemSelect) {
                            return Row(
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: width100 * 0.038,
                                  ),
                                )
                              ],
                            );
                          },
                          headerBuilder: (context, selectedItem) {
                            return Row(
                              children: [
                                Text(
                                  selectedItem,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: width100 * 0.038,
                                  ),
                                )
                              ],
                            );
                          },
                          items: userTypes,
                          onChanged: (String? newValue) {
                            setState(() {
                              userType = newValue!;
                            });
                          }),
                    ),
                    Text(
                      'Username : ',
                      textAlign: TextAlign.left,
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
                    const Text(
                      'Password : ',
                      textAlign: TextAlign.left,
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
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
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
        ),
      ),
    );
  }
}
