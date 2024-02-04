import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 100); // Start from the top-left
    path.quadraticBezierTo(size.width / 2, 0, size.width, 100); // Curve to the top-right
    path.lineTo(size.width, size.height); // Line to the bottom-right
    path.lineTo(0, size.height); // Line to the bottom-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

