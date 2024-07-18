import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/studentsList/student_details_controller.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student = Get.arguments;

  StudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDetailsController controller = Get.put(StudentDetailsController(student: student));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.toNamed('/edit-student', arguments: student);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Gender: ${student.gender}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Age: ${student.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Class: ${student.studentClass}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Address: ${student.physicalAddress}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Parent Phone: ${student.parentPhoneNumber}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('School Fees: ${student.expectedFees}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Paid Amount: ${student.paidAmount}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Outstanding Fees: ${student.outstandingBalance}', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.deleteStudent();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('DELETE ${student.name}', style: const TextStyle(fontSize: 16),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // print bio-data logic
                    Fluttertoast.showToast(msg: "Printing bio-data", gravity: ToastGravity.CENTER);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Print Bio-data', style: TextStyle(fontSize: 16),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
