import 'package:flutter/material.dart';

class AllotedBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alloted Bus'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BusCard(
              busNumber: '',
              routes: [
                'Bus Number : 1',
                'Vehicle Plate Number : KL 01 XX 0309',
                'Carrying Capacity : 15',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  final String busNumber;
  final List<String> routes;

  const BusCard({
    Key? key,
    required this.busNumber,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Details: $busNumber',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: routes.map((route) => Text('- $route')).toList(),
            ),
          ],
        ),
      ),
    );
  }
}