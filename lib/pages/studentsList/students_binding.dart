import 'package:get/get.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';

class StudentsBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut<StudentsController>(
       ()=> StudentsController());
  }

}