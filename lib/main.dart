import 'package:flutter/material.dart';
import 'package:sample_project/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          color: Colors.blue[800],
        ),
      ),
      home: Login(),
    );
  }
}
