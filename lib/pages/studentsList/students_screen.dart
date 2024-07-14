import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_student.dart';
import 'students_controller.dart';

class StudentsScreen extends StatelessWidget {
  final StudentsController controller = Get.put(StudentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: GestureDetector(
        onTap: (){
          print("Hello student");
        },
          child: StudentsListView()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(() => AddStudentScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class StudentsListView extends StatefulWidget {
  @override
  _StudentsListViewState createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      builder: (controller) {
        if (controller.students.isEmpty) {
          return Center(child: CircularProgressIndicator());
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
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        title: Text(
                          students[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'ID: ${students[index].id}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
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
                  child: Text(
                    'Show More',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              SizedBox(height: 40,)
            ],
          ),
        );
      },
    );
  }
}
