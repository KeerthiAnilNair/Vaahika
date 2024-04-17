import 'package:flutter/material.dart';
import 'package:sample_project/indstud_details.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vaahika',
          style: TextStyle(
            fontFamily: 'LakkiReddy',
            fontSize: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            // Generate dynamic titles and subtitles with incremental numbers
            String title = 'Student${index + 1}';
            String subtitle = '${200736 + index}';
            return StudentTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetailsAdmin(),
                  ),
                );
              },
              title: title,
              subtitle: subtitle,
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 47,
        ),
      ),
    );
  }
}

class StudentTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  const StudentTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.subtitle,
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
      // trailing: Text('0'),
    );
  }
}
