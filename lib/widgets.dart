// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class StudentDetailsCard extends StatelessWidget {
  final String name;
  final String admissionNumber;
  final String profileImage; // You can use a URL or asset path for the image

  StudentDetailsCard({
    required this.name,
    required this.admissionNumber,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width *
          0.9, // Half the height of the display context
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                profileImage), // Or AssetImage(profileImage) for local assets
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Admission Number: $admissionNumber',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
