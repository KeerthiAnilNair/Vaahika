import 'package:flutter/material.dart';
import 'package:sample_project/indriv_details.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Driver Details',
          style: TextStyle(
            fontFamily: 'LakkiReddy',
            fontSize: 36,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DriverDetailsAdmin()), //NAVIGATION
                    );
                  },
                  title: Text('Name'),
                  subtitle: Text('Username'),
                  // leading: const CircleAvatar(
                  //   radius: 25,
                  //   backgroundImage: AssetImage('assets/images/user.png'),
                  // ),
                  // trailing: Text('0'),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: 100)),
    );
  }
}
