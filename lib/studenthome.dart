// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sample_project/check_route.dart';
import 'package:sample_project/feepayment.dart';
import 'package:sample_project/student_personal_details.dart';
import 'widgets.dart';

class StudentHome extends StatelessWidget {
  StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vaahika',
          style: TextStyle(
            fontFamily: 'LakkiReddy',
            fontSize: 36,
          ),
        ),
      ),
      
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: width100 * 0.05),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: StudentDetailsCard(
                    name: 'John Doe',
                    admissionNumber: '211512',
                    profileImage: 'assets/images/user.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, -7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StudentPersonalDetails()),
                                  );
                                },
                                child: Container(
                                  width:
                                      144, // Adjust the width according to your preference
                                  height:
                                      127, // Adjust the height according to your preference
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        255, 223, 254, 199), // Background color
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ], // Optional: Round corners
                                  ),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Image.asset(
                                        'assets/images/personaldetails.png',
                                        width: 65,
                                        height: 65,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Personal Details',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              95, 88, 88, 1), // Text color
                                          fontFamily: 'Laila',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Student student = Student(
                                    name: 'John Doe',
                                    admissionNumber: 'ABCD1234',
                                    fees: 500,
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudentPaymentsPage(
                                                student: student)),
                                  );
                                },
                                child: Container(
                                  width:
                                      144, // Adjust the width according to your preference
                                  height: 127, // Make it a square
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        255, 255, 220, 254), // Background color
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ], // Optional: Round corners
                                  ),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Image.asset(
                                        'assets/images/payfees.png',
                                        width: 65,
                                        height: 65,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Pay Fees',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              95, 88, 88, 1), // Text color
                                          fontFamily: 'Laila',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckRoute()),
                                  );
                                },
                                child: Container(
                                  width:
                                      144, // Adjust the width according to your preference
                                  height:
                                      127, // Adjust the height according to your preference
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        255, 199, 228, 254), // Background color
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ], // Optional: Round corners
                                  ),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Image.asset(
                                        'assets/images/checkroute.png',
                                        width: 65,
                                        height: 65,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Check Route',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              95, 88, 88, 1), // Text color
                                          fontFamily: 'Laila',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentHome()),
                                  );
                                },
                                child: Container(
                                  width:
                                      144, // Adjust the width according to your preference
                                  height:
                                      127, // Adjust the height according to your preference
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        255, 254, 235, 199), // Background color
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ], // Optional: Round corners
                                  ),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Image.asset(
                                        'assets/images/updatelocation.png',
                                        width: 65,
                                        height: 65,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Update Location',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              95, 88, 88, 1), // Text color
                                          fontFamily: 'Laila',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
