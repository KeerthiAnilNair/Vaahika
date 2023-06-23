import 'package:flutter/material.dart';

class ManageRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Routes'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BusRouteCard(
              busNumber: 'Bus 1',
              routes: [
                'Route 1',
                'Route 2',
                'Route 3',
                'Route 4',
              ],
            ),
            BusRouteCard(
              busNumber: 'Bus 2',
              routes: [
                'Route A',
                'Route B',
                'Route C',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BusRouteCard extends StatelessWidget {
  final String busNumber;
  final List<String> routes;

  const BusRouteCard({
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
              'Bus Number: $busNumber',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Routes:',
              style: TextStyle(
                fontSize: 16.0,
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