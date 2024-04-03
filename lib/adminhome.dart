import 'package:flutter/material.dart';
import 'package:sample_project/driver_details.dart';
import 'package:sample_project/student_details.dart';
import 'package:sample_project/manage_route.dart';
import 'package:sample_project/managebus.dart';
import 'widgets.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key});

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height100 * 0.05),
            StudentDetailsCard(
              height: height100 * 0.25,
              width: width100 * 0.85,
              cardColor: Color(0xFFdaf3ed),
              name: 'Admin',
              admissionNumber: '123456', // Provide admissionNumber here
              profileImage: 'assets/images/user.png',
            ),
            SizedBox(height: height100 * 0.03),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ActionCard(
                    title: 'Student Details',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentDetails(),
                        ),
                      );
                    },
                    imagePath: 'assets/images/personaldetails.png',
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFF8eb1d2),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    title: 'Driver Details',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DriverDetails(),
                        ),
                      );
                    },
                    imagePath: 'assets/images/personaldetails.png',
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFFffeddc),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    title: 'Manage Bus',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageBus(),
                        ),
                      );
                    },
                    imagePath: 'assets/images/allotedbus.png',
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFFebe4ce),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    title: 'Manage Routes',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageRoutes(),
                        ),
                      );
                    },
                    imagePath: 'assets/images/checkroute.png',
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFFe3a770),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
