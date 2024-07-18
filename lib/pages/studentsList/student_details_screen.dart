import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/studentsList/student_details_controller.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';

import '../../Routes/app_pages.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student = Get.arguments;

  StudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDetailsController controller = Get.put(StudentDetailsController(student: student));

    return Scaffold(
      appBar: AppBar(
        title: Text('${student.name}', style: const TextStyle(fontSize: 18)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('Name', student.name),
            _buildInfoCard('Gender', student.gender),
            _buildInfoCard('Age', student.age.toString()),
            _buildInfoCard('Class', student.studentClass),
            _buildInfoCard('Address', student.physicalAddress),
            _buildInfoCard('Parent Phone', student.parentPhoneNumber),
            _buildInfoCard('School Fees', student.expectedFees.toString()),
            _buildInfoCard('Paid Amount', student.paidAmount.toString()),
            _buildInfoCard('Outstanding Fees', student.outstandingBalance.toString()),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    Routes.PAYMENTSEACH,
                    arguments: {'studentId': student.id},
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Payments', style: TextStyle(fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 12,
      color: Colors.green.shade50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$title: $value',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
