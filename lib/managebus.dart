import 'package:flutter/material.dart';

class ManageBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Buses'),
      ),
      body: ListView.builder(
        itemCount: 4, // Assuming there are 4 buses
        itemBuilder: (context, index) {
          // Dummy data for buses, drivers, and routes
          String busNo = 'Bus ${index + 1}';
          String busNumberPlate = 'KL 01 BH ${1000 + index}';
          String driverName = 'Driver${index + 1}';
          String driverId = 'D82f${index + 1}';
          String routeNo = 'Route ${index + 1}';

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(busNo),
              ),
              title: Text('Bus Number Plate: $busNumberPlate'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Driver Name: $driverName'),
                  Text('Driver ID: $driverId'),
                  Text('Route No: $routeNo'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
