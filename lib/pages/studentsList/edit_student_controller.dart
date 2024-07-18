import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import '../../api/api_repository.dart';

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

  void updateStudent() async {
    final updatedStudent = Student(
      id: student.id,
      name: nameController.text,
      gender: genderController.text,
      age: int.parse(ageController.text),
      studentClass: studentClassController.text,
      physicalAddress: physicalAddressController.text,
      parentPhoneNumber: parentPhoneNumberController.text,
      expectedFees: student.expectedFees,
      outstandingBalance: student.outstandingBalance,
      paidAmount: student.paidAmount,
    );

    try {
      final apiRepository = Get.find<ApiRepository>();
      await apiRepository.updateStudent(updatedStudent);
      // Update the student in the list
      final studentsController = Get.find<StudentsController>();
      final index = studentsController.students.indexWhere((s) => s.id == student.id);
      if (index != -1) {
        studentsController.students[index] = updatedStudent;
        Get.snackbar('Success', 'Student updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update student');
    }
  }
}
