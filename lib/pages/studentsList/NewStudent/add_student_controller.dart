import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/Models/responses/studentDetails_response.dart';

import '../students_controller.dart';

class AddStudentController extends GetxController {
  final ApiRepository apiRepository;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  AddStudentController({required this.apiRepository});

  Future<void> addStudent(Student student) async {
    isLoading.value = true;
    try {
      await apiRepository.addStudent(student);
      Get.back(); // Go back after successful addition
      Get.find<StudentsController>().fetchStudents(); // Refresh the student list
      isLoading(false);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
