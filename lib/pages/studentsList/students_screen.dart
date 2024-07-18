import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/api/api.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import '../../Models/responses/studentDetails_response.dart';
import '../../Routes/app_pages.dart';
import 'NewStudent/add_student.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({super.key});

  @override
  _StudentsListViewState createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentsController(apiRepository: Get.find<ApiRepository>()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // search logic
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.students.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final students = showAll ? controller.students : controller.students.take(6).toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(
                          students[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Class: ${students[index].studentClass}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          Get.toNamed('/student-details', arguments: students[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              if (!showAll && controller.students.length > 6)
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
                      color: Colors.blue,
                    ),
                  ),
                ),
              const SizedBox(height: 40,)
            ],


class StudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudentsController controller = Get.find<StudentsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: GetBuilder<StudentsController>(
        builder: (controller) {
          if (controller.students.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return StudentsListView(students: controller.students);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(()=>AddStudentScreen());g
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
class StudentsListView extends StatelessWidget {
  final List<StudentStatus> students;

  const StudentsListView({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text(
              students[index].firstName ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Class: ${students[index].studentClass ?? ''}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
            onTap: () {
            },
          ),
        );
      }),
    );
  }
}
