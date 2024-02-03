import 'package:flutter/material.dart';
import 'package:sample_project/alloted_route.dart';
import 'package:sample_project/alloted_bus.dart';
import 'package:sample_project/student_personal_details.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/shome.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                                offset:
                                    Offset(3, 3), // changes position of shadow
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllotedBus()),
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
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ], // Optional: Round corners
                          ),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image.asset(
                                'assets/images/allotedbus.png',
                                width: 65,
                                height: 65,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'Alloted Bus',
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
                                builder: (context) => const AllotedRoute()),
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
                                offset:
                                    Offset(3, 3), // changes position of shadow
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
                                'Alloted Route',
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DriverHome()),
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
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ], // Optional: Round corners
                          ),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image.asset(
                                'assets/images/setavailability.png',
                                width: 65,
                                height: 65,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'Set Availability',
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
            )
          ],
        ),
      ),
    );
  }
}
