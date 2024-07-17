import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/Routes/app_pages.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';

class EditStudentController extends GetxController {
  final Student student;

  EditStudentController({required this.student});

  late final TextEditingController nameController;
  late final TextEditingController genderController;
  late final TextEditingController ageController;
  late final TextEditingController studentClassController;
  late final TextEditingController physicalAddressController;
  late final TextEditingController parentPhoneNumberController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: student.name);
    genderController = TextEditingController(text: student.gender);
    ageController = TextEditingController(text: student.age.toString());
    studentClassController = TextEditingController(text: student.studentClass);
    physicalAddressController = TextEditingController(text: student.physicalAddress);
    parentPhoneNumberController = TextEditingController(text: student.parentPhoneNumber);
  }

  @override
  void onClose() {
    nameController.dispose();
    genderController.dispose();
    ageController.dispose();
    studentClassController.dispose();
    physicalAddressController.dispose();
    parentPhoneNumberController.dispose();
    super.onClose();
  }

  void updateStudent() {
    // Implement the update student logic here
  }

  void deleteStudent() {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Student'),
        content: const Text('Are you sure you want to delete this student?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Dismiss the dialog
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // delete logic here
              Get.toNamed(Routes.STUDENTS); // Go back to the previous screen after deletion
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
