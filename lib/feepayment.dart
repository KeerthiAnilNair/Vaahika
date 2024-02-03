import 'package:flutter/material.dart';

class Student {
  final String name;
  final String admissionNumber;
  final double fees;

  Student({
    required this.name,
    required this.admissionNumber,
    required this.fees,
  });
}

class StudentPaymentsPage extends StatelessWidget {
  final Student student;

  StudentPaymentsPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Admission Number: ${student.admissionNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Fees to be Paid: \$${student.fees.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page for payment
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentConfirmationPage(student: student),
                  ),
                );
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  final Student student;

  PaymentConfirmationPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Admission Number: ${student.admissionNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Fees Paid: \$${student.fees.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  Student student = Student(
    name: 'John Doe',
    admissionNumber: 'ABCD1234',
    fees: 500,
  );

  runApp(MaterialApp(
    home: StudentPaymentsPage(student: student),
  ));
}
