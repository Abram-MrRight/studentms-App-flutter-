import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import 'edit_student_controller.dart';

class EditStudentScreen extends StatelessWidget {
  final Student student = Get.arguments;

  EditStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditStudentController controller = Get.put(EditStudentController(student: student));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.blue,),
            onPressed: () {
              controller.updateStudent();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: controller.genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: controller.ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.studentClassController,
              decoration: const InputDecoration(labelText: 'Class'),
            ),
            TextField(
              controller: controller.physicalAddressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: controller.parentPhoneNumberController,
              decoration: const InputDecoration(labelText: 'Parent Phone'),
              keyboardType: TextInputType.phone,
            )
          ],
        ),
      ),
    );
  }
}
