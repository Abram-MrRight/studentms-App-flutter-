import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/Models/responses/studentDetails_response.dart';
import '../students_controller.dart';
import 'add_student_controller.dart';

class AddStudentScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController parentPhoneController = TextEditingController();

  // Gender and Class lists
  final List<String> genderOptions = ['M', 'F'];
  final List<String> classOptions = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6'];

  @override
  Widget build(BuildContext context) {
    final AddStudentController controller = Get.find();
    final StudentsController studentsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 12,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the first name';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: genderOptions.first,
                      decoration: InputDecoration(labelText: 'Gender'),
                      items: genderOptions.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        genderController.text = newValue ?? genderOptions.first;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select the gender';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the age';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: classOptions.first,
                      decoration: InputDecoration(labelText: 'Class'),
                      items: classOptions.map((String className) {
                        return DropdownMenuItem<String>(
                          value: className,
                          child: Text(className),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        classController.text = newValue ?? classOptions.first;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select the class';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(labelText: 'Physical Address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the physical address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: parentPhoneController,
                      decoration: InputDecoration(labelText: 'Parent Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the parent\'s phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: feesController,
                      decoration: InputDecoration(labelText: 'Expected Fees'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter school amount';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            try {
                              final student = Student(
                                expectedFees: int.parse(feesController.text),
                                name: firstNameController.text,
                                gender: genderController.text,
                                age: int.parse(ageController.text),
                                studentClass: classController.text,
                                physicalAddress: addressController.text,
                                parentPhoneNumber: parentPhoneController.text,
                                id: int.tryParse(idController.text) ?? 0,
                              );
                              controller.addStudent(student).then((_) {
                                Get.snackbar('Success', 'Student added successfully'); // Show success message
                                Future.delayed(Duration(seconds: 1), () { // Delay to ensure snackbar is visible
                                  Get.back(); // Close the screen
                                  studentsController.refreshStudents(); // Refresh student list
                                });
                              }).catchError((error) {
                                Get.snackbar('Error', 'Failed to add student');
                              });
                            } catch (e) {
                              Get.snackbar('Error', 'Invalid input values');
                            }
                          }
                        },
                        child: Text('Add Student'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      );
                    }),
                    Obx(() {
                      if (controller.errorMessage.value.isNotEmpty) {
                        return Text(
                          controller.errorMessage.value,
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      return SizedBox.shrink();
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
