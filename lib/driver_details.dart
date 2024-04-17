import 'package:flutter/material.dart';
import 'package:sample_project/indriv_details.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({Key? key}) : super(key: key);

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
            return DriverTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverDetailsAdmin(),
                  ),
                );
              },
              title: 'Driver${index + 1}', // Generate title dynamically
              subtitle: 'D82f${index + 1}', // Generate subtitle dynamically
              value: index + 1, // Increment the value by 1 for each tile
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 4,
        ),
      ),
    );
  }
}

class DriverTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final int value; // New parameter for the incremented value

  const DriverTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.value, // Added new parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      trailing: Text('$value'), // Display the incremented value
    );
  }
}
