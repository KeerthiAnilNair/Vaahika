import 'package:flutter/material.dart';

class DriverDetailsAdmin extends StatelessWidget {
  const DriverDetailsAdmin({super.key});
  final String profileImageUrl =
      'https://example.com/profile-picture.jpg'; // Replace with your profile picture URL
  final String name = 'Driver3'; // Replace with your name
  final String year = '38'; // Replace with your year
  final String department = 'Computer Science'; // Replace with your department
  final String phoneNumber = '9605242189'; // Replace with your phone number
  final String emailId = 'driver3@gmail.com'; // Replace with your email ID
  final String address =
      '123 Main Street, City, Country'; // Replace with your address

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            SizedBox(height: 16.0),
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Age : $year',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Phone Number: $phoneNumber',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: $emailId',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Address: $address',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 8.0),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const StudentDetailsAdmin()),
            //     );
            //   },
            //   child: Text('Edit Pofile'),
            // ),
          ],
        ),
      ),
    );
  }
}
