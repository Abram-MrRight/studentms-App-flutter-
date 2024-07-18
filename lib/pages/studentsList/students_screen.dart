import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/Routes/app_pages.dart';
import 'package:studentms_app/api/api.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import 'NewStudent/add_student.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({super.key});

  @override
  _StudentsListViewState createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  bool showAll = false;
  String searchQuery = '';
  final searchController = TextEditingController();
  final controller = Get.put(StudentsController(apiRepository: Get.find<ApiRepository>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students (${controller.totalStudents.value})'),
        backgroundColor:  Color.fromARGB(217, 104, 228, 98),
        //backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                searchQuery = '';
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5), // Border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Border color and width when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2), // Border color and width when not focused
                ),
                filled: true,
                fillColor: Colors.white, // Background color
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.students.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final filteredStudents = controller.students
                  .where((student) => student.name.toLowerCase().contains(searchQuery.toLowerCase()))
                  .toList();

              final students = showAll ? filteredStudents : filteredStudents.take(6).toList();

              return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.brown, width: 2), // Colored border
                    ),
                    color: Colors.brown[50], // Light blue background color
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      title: Text(
                        students[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Blue text color
                        ),
                      ),
                      subtitle: Text(
                        'Class: ${students[index].studentClass}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Blue-grey text color
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (String value) {
                          if (value == 'Edit') {
                            Get.toNamed('/edit-student', arguments: students[index]);
                          } else if (value == 'Delete') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Student'),
                                  content: const Text('Are you sure you want to delete this student?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Dismiss the dialog
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey,
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        controller.deleteStudent(students[index].id);
                                        Navigator.of(context).pop(); // Dismiss the dialog
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Student deleted',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                      ),
                                    )


                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                );

                              },
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return {'Edit', 'Delete'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                      onTap: () {
                        Get.toNamed('/student-details', arguments: students[index]);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          if (!showAll && controller.students.length > 5)
            TextButton(
              onPressed: () {
                setState(() {
                  showAll = true;
                });
              },
              child: const Text(
                'Show More',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(217, 104, 228, 98),
        onPressed: () {
          Get.toNamed(Routes.ADD);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
