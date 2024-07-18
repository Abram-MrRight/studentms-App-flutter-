import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../Models/responses/studentDetails_response.dart';
import '../../api/api_repository.dart';
class Student {
  final int id;
  final String name;
  final String gender;
  final int age;
  final String studentClass;
  final String physicalAddress;
  final String parentPhoneNumber;
  final int expectedFees;
  final int? paidAmount;
  final int? outstandingBalance;
  Student({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.studentClass,
    required this.physicalAddress,
    required this.parentPhoneNumber,
    required this.expectedFees,
     this.paidAmount,
     this.outstandingBalance,
  });
}
class StudentsController extends GetxController {
  var students = <Student>[].obs;
  final ApiRepository apiRepository;
  final logger = Logger();
  StudentsController({required this.apiRepository});

  var studentsResponse = Rxn<StudentsResponse>();
  var totalStudents = 0.obs;  // Observable for total number of students


  @override
  void onInit() {
  super.onInit();
  fetchStudents();
  }
  void fetchStudents() async {
    EasyLoading.show(status: 'Loading...');
    try {
      var response = await apiRepository.getStudentDetails();
      logger.i('API response: ${response?.status}');
      if (response != null) {
        studentsResponse.value = response;
        students.clear();
        totalStudents.value = response.numberOfStudents;
        for (var studentStatus in response.studentsStatus) {
          students.add(Student(
            id: studentStatus.studentId,
            name: studentStatus.firstName,
            gender: studentStatus.gender,
            age: studentStatus.age,
            studentClass: studentStatus.studentClass,
            physicalAddress: studentStatus.physicalAddress,
            parentPhoneNumber: studentStatus.parentPhoneNumber,
            expectedFees: studentStatus.status.expectedFees,
            paidAmount: studentStatus.status.paidAmount,
            outstandingBalance: studentStatus.status.outstandingBalance,
          ));
        }
      } else {
        EasyLoading.showError('Failed to fetch student details');
      }
    } catch (e) {
      logger.e('Error fetching student details: $e');
      EasyLoading.showError('An error occurred: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
  Future<void> deleteStudent(int studentId) async {
    try {
      await apiRepository.deleteStudent(studentId);
      students.removeWhere((student) => student.id == studentId);
      totalStudents.value = students.length;
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete student');
    }
  }

  void refreshStudents() {
    fetchStudents();
  }

  }