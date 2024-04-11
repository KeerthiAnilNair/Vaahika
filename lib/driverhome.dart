import 'package:flutter/material.dart';
import 'package:sample_project/alloted_route.dart';
import 'package:sample_project/alloted_bus.dart';
import 'package:sample_project/student_personal_details.dart';
import 'package:sample_project/setavailability.dart';
import 'widgets.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height100 * 0.05),
            StudentDetailsCard(
              height: height100 * 0.15,
              width: width100 * 0.85,
              cardColor: Color(0xFFdaf3ed),
              name: 'John Doe',
              admissionNumber: '211512',
              profileImage: 'assets/images/user.png',
            ),
            SizedBox(height: height100 * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ActionCard(
                    imagePath: 'assets/images/personaldetails.png',
                    title: 'Personal Details',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentPersonalDetails(),
                        ),
                      );
                    },
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFF8eb1d2),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    imagePath: 'assets/images/allotedbus.png',
                    title: 'Alloted Bus',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllotedBus(),
                        ),
                      );
                    },
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFFffeddc),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    imagePath: 'assets/images/checkroute.png',
                    title: 'Alloted Route',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllotedRoute(),
                        ),
                      );
                    },
                    width: width100 * 0.8,
                    height: height100 * 0.125,
                    backgroundColor: Color(0xFFebe4ce),
                  ),
                  SizedBox(height: height100 * 0.02),
                  ActionCard(
                    imagePath: 'assets/images/setavailability.png',
                    title: 'Set Availability',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetAvailability(),
                        ),
                      );
                    },
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
