import 'package:get/get.dart';
import '../../api/api_repository.dart';
import '../../Models/responses/studentDetails_response.dart';

class StudentsController extends GetxController {
  final ApiRepository apiRepository;

  StudentsController({required this.apiRepository});

  var students = <StudentStatus>[].obs; // Ensure it's an observable list

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    try {
      final studentsResponse = await apiRepository.getStudentDetails();
      if (studentsResponse != null) {
        students.assignAll(studentsResponse.studentsStatus);
      }
    } catch (e) {
      print('Error fetching students: $e');
    }
  }
}
