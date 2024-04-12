// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously, avoid_print, prefer_const_literals_to_create_immutables

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
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? userType; // Default value
  LocalStorage storage = LocalStorage('data');
  List<String> userTypes = ['Student', 'Driver', 'Admin'];
  String userName = '';
  String password = '';
  void handleSubmit() async {
    String baseUrl = 'https://bus-scheduling-backend.vercel.app/api';
    print('$userName\n$password');
    if (userType == 'Student') {
      var res = await http.post(Uri.parse('$baseUrl/user/signin'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'userID': userName, 'password': password}));
      var userData = await json.decode(json.encode(res.body));
      var responseData = json.decode(userData);

      if (responseData['status'] == "ok") {
        storage.setItem('token', responseData['data']['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentHome()),
        );
      } else {
        print(responseData['msg']);
      }
    } else if (userType == 'Driver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DriverHome()),
      );
    } else if (userType == 'Admin') {
      var res = await http.post(Uri.parse('$baseUrl/user/signin'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'userID': userName, 'password': password}));
      var userData = await json.decode(json.encode(res.body));
      print(userData);
      var responseData = json.decode(userData);
      print(responseData);
      if (responseData['status'] == "ok") {
        storage.setItem('token', responseData['data']['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      }
    }
  }

  // void handleSubmit() async {
  //   if (userType == 'Student') {
  //     await Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => StudentHome()));
  //   } else if (userType == 'Admin') {
  //     await Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => AdminHome()));
  //   } else {
  //     await Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => DriverHome()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height - bottom * 0.5;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
                top: width100 * 0.1,
                left: width100 * 0.05,
                right: width100 * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width100 * 0.325,
                  padding: EdgeInsets.only(left: width100 * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/light.png'),
                        size: width100 * 0.1,
                      ),
                      ImageIcon(
                        AssetImage('assets/images/typo.png'),
                        size: width100 * 0.2,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: height100 * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Vaahika',
                        //   style: TextStyle(
                        //       fontFamily: 'Anton',
                        //       fontSize: width100 * 0.15,
                        //       color: Colors.blue[800]),
                        // ),
                        SizedBox(height: height100 * 0.04),
                        Card(
                          color: Color(0xFF336cef),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(height100 * 0.08),
                              topRight: Radius.circular(height100 * 0.08),
                              bottomRight: Radius.circular(height100 * 0.08),
                              bottomLeft: Radius.circular(height100 * 0.01),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(height100 * 0.02),
                            height: height100 * 0.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width100 * 0.9,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Login',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            letterSpacing: 1.2,
                                            fontFamily: 'Poppins',
                                            fontSize: width100 * 0.09,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: height100 * 0.05),
                                      CustomDropdown<String>(
                                          decoration: CustomDropdownDecoration(
                                            closedFillColor: Color(0xFF336cef),
                                            expandedFillColor:
                                                Color(0xFF336cef),
                                            expandedSuffixIcon: Icon(
                                              Icons.keyboard_arrow_up_outlined,
                                              color: Colors.white,
                                            ),
                                            closedSuffixIcon: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: Colors.white,
                                            ),
                                            closedBorder: Border.all(
                                                color: Colors.white,
                                                width: 1.25),
                                            expandedBorder: Border.all(
                                                color: Colors.white,
                                                width: 1.25),
                                          ),
                                          hintText: 'Select User Type',
                                          hintBuilder: (context, hint) {
                                            return Row(
                                              children: [
                                                Text(
                                                  hint,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          width100 * 0.038),
                                                ),
                                              ],
                                            );
                                          },
                                          listItemBuilder: (context, item,
                                              isSelected, onItemSelect) {
                                            return Row(
                                              children: [
                                                Text(
                                                  item,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: width100 * 0.038,
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                          headerBuilder:
                                              (context, selectedItem) {
                                            return Row(
                                              children: [
                                                Text(
                                                  selectedItem,
                                                  style: TextStyle(
                                                    color: Colors.white,
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
                                      SizedBox(height: height100 * 0.02),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height100 * 0.015),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height100 * 0.015),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          contentPadding:
                                              EdgeInsets.all(height100 * 0.016),
                                          labelText: 'Username',
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: width100 * 0.038,
                                          ),
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            userName = newValue;
                                          });
                                        },
                                      ),
                                      SizedBox(height: height100 * 0.02),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        cursorColor: Colors.white,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height100 * 0.015),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height100 * 0.015),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          contentPadding:
                                              EdgeInsets.all(height100 * 0.016),
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: width100 * 0.038,
                                          ),
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            password = newValue;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height100 * 0.02),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(Size(
                                        width100 * 0.75, height100 * 0.05)),
                                  ),
                                  onPressed: handleSubmit,
                                  child: Text('SUBMIT',
                                      style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontFamily: 'Poppins',
                                          fontSize: height100 * 0.02,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height100 * 0.02),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: width100 * 0.035,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: "Sign Up ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: width100 * 0.035,
                                  color: Colors.lightBlue,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
