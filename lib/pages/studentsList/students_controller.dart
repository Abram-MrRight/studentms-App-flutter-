import 'package:get/get.dart';

class Student {
  final int id;
  final String name;

  Student(this.id, this.name);
}

class StudentsController extends GetxController {
  var students = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() {
    // Simulate fetching data from an API or database
    var fetchedStudents = [
      Student(1, 'Student 1'),
      Student(2, 'Student 2'),
      Student(3, 'Student 3'),
      Student(4, 'Student 4'),
      Student(5, 'Student 5'),
      Student(6, 'Student 6'),
      Student(7, 'Student 7'),
      Student(8, 'Student 8'),
    ];
    students.addAll(fetchedStudents);
  }
}
