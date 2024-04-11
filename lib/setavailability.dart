import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SetAvailability extends StatefulWidget {
  @override
  _SetAvailabilityState createState() => _SetAvailabilityState();
}

class _SetAvailabilityState extends State<SetAvailability> {
  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Availability'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Select the date(s) to mark leave',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectDate,
            child: Text('Pick Date'),
          ),
          SizedBox(height: 20),
          Text(
            'Applied Leaves',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: selectedDates.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    DateFormat('MMM dd, yyyy').format(selectedDates[index]),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        selectedDates.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
      selectableDayPredicate: (DateTime date) {
        // Allow selection only for the next 7 days from the current date
        final now = DateTime.now();
        return date.isAfter(now) && date.isBefore(now.add(Duration(days: 8)));
      },
    );
    if (pickedDate != null) {
      setState(() {
        selectedDates.add(pickedDate);
      });
    }
  }
}
