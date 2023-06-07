import 'package:flutter/material.dart';
import 'package:sample_project/student_personal_details.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/shome.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentPersonalDetails()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green[300], // Background color
              ),
              child: Text('Personal Details'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentHome()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100], // Background color
              ),
              child: Text('Pay Fees'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentHome()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[200], // Background color
              ),
              child: Text('Check Route'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentHome()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[200], // Background color
              ),
              child: Text('Update Location'),
            ),
          ],
        ),
      ),
    );
  }
}
