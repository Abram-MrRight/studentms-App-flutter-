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
        title:  Text('${student.name}', style: const TextStyle(fontSize: 18)),

        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildTextFieldCard('Name', controller.nameController, TextInputType.text),
              _buildTextFieldCard('Gender', controller.genderController, TextInputType.text),
              _buildTextFieldCard('Age', controller.ageController, TextInputType.number),
              _buildTextFieldCard('Class', controller.studentClassController, TextInputType.text),
              _buildTextFieldCard('Address', controller.physicalAddressController, TextInputType.text),
              _buildTextFieldCard('Parent Phone', controller.parentPhoneNumberController, TextInputType.phone),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateStudent();
                    Future.delayed(Duration(seconds: 1), () { // Delay to ensure snackbar is visible
                      Get.back(); // Close the screen
                     // studentsController.refreshStudents(); // Refresh student list
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: Text('Save ${student.name}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldCard(String label, TextEditingController controller, TextInputType inputType) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
