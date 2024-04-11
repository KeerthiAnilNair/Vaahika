// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sample_project/check_route.dart';
import 'package:sample_project/feepayment.dart';
import 'package:sample_project/updatelocation.dart';
import 'package:sample_project/student_personal_details.dart';
import 'widgets.dart';

class StudentHome extends StatelessWidget {
  StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height;
    double cardwidth = width100 * 0.8;
    double cardheight= height100 * 0.125;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height100 * 0.25),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          backgroundColor: Color(0xFF183536),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: StudentDetailsCard(
                  height: height100 * 0.15,
                  width: width100 * 0.85,
                  cardColor: Color(0xFFdaf3ed),
                  name: 'John Doe',
                  admissionNumber: '211512',
                  profileImage: 'assets/images/user.png',
                ),
              ),
              // Add other widgets or components if needed
            ],
          ),
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: width100 * 0.05),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40,top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionCard(
                            imagePath: 'assets/images/personaldetails.png',
                            title: 'Personal Details',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentPersonalDetails(),
                                ),
                              );
                            },
                            width: cardwidth,
                            height: cardheight,
                            backgroundColor: Color(0xFF8eb1d2),
                          ),
                          
                          ActionCard(
                            imagePath: 'assets/images/payfees.png',
                            title: 'Pay Fees',
                            onTap: () {
                              Student student = Student(
                                name: 'John Doe',
                                admissionNumber: 'ABCD1234',
                                fees: 500,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StudentPaymentsPage(student: student),
                                ),
                              );
                            },
                            width: cardwidth,
                            height: cardheight,
                            backgroundColor: Color(0xFFffeddc),
                          ),
                          
                          ActionCard(
                            imagePath: 'assets/images/checkroute.png',
                            title: 'Check Route',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckRoute(),
                                ),
                              );
                            },
                            width: cardwidth,
                            height: cardheight,
                            backgroundColor: Color(0xFFebe4ce),
                          ),
                          ActionCard(
                            imagePath: 'assets/images/updatelocation.png',
                            title: 'Update Location',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateLocation(),
                                ),
                              );
                            },
                            width: cardwidth,
                            height: cardheight,
                            backgroundColor: Color(0xFFe3a770),
                          ),
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
