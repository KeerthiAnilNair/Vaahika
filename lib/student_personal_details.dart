// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
class StudentPersonalDetails extends StatefulWidget {
  const StudentPersonalDetails({super.key});

  @override
  State<StudentPersonalDetails> createState() => _StudentPersonalDetailsState();
}

class _StudentPersonalDetailsState extends State<StudentPersonalDetails> {
  final String profileImageUrl =
      'https://example.com/profile-picture.jpg'; 

  final String year = 'S8';
  final String age = '22';
  final String phone = '9544270166';
  final String address = 'Palayam';
  final String gender = 'Female';
 // Replace with your year
  final String department = 'Computer Science'; 
 // Replace with your department

  var stop='';
  bool loading=false;
  late Map<String,dynamic> student;
  

 Future<void> getStudent() async{
    LocalStorage storage = LocalStorage('data');
    final token=storage.getItem('token');

    var res=await http.get(Uri.parse('https://bus-scheduling-backend.vercel.app/api/user/me'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );

    var studentData=json.decode(res.body);
    print(studentData);

    if(studentData['status']=="ok"){
      setState(() {
        student=studentData['data']['user'];
        print(student);
        // stop=studentData['data']['stop']['stop_name'];
        loading=false;
      });
     
      
    }
 }
  @override
  void initState() {
    super.initState();
    setState(() {
      loading=true;
    });
    getStudent();
  }
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
      body: loading?Container(
        height: MediaQuery.of(context).size.height,
        child:Center(
          child: 
          CircularProgressIndicator(backgroundColor: Colors.cyan),
        )
      ):SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: Image.asset(
                './assets/images/user.png',
              ).image,
            ),
            SizedBox(height: 16.0),
            Text(
              student['name'].toString(),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
                  SizedBox(height: 18.0),
                  Text(
                    'Age: $age',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Gender: $gender',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Semester: $year',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Department: $department',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
                  Text(
                    'Phone Number: $phone',
                    style: TextStyle(fontSize: 18.0),
                  ),
            SizedBox(height: 8.0),
            Text(
              'Email: ${student['email']}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
                  Text(
                    'Bus Stop : $address',
                    style: TextStyle(fontSize: 18.0),
                  ),
            SizedBox(height: 8.0),
            // Text(
            //   'Bus Stop: $stop',
            //   style: TextStyle(fontSize: 18.0),
            // ),
            
          ],
        ),
      ),
    );
  }
}
