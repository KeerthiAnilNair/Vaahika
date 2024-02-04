// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class StudentDetailsCard extends StatelessWidget {
  final String name;
  final String admissionNumber;
  final String profileImage;
  final double height;
  final double width;
  final Color cardColor; // You can use a URL or asset path for the image

  StudentDetailsCard({
    required this.name,
    required this.admissionNumber,
    required this.profileImage,
    required this.height,
    required this.width,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
        color: cardColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: width,
            maxWidth: width,
            minHeight: height,
            maxHeight: height,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: width * 0.09,
                backgroundImage: AssetImage(
                    profileImage), // Or AssetImage(profileImage) for local assets
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontFamily: 'Poppins',fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admission No: $admissionNumber',
                    style: TextStyle(fontFamily: 'Arvo',fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color backgroundColor;

  const ActionCard({
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: 65,
                  height: 65,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black54, // Choose your arrow color
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
