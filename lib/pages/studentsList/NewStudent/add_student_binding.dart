import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';

import 'add_student_controller.dart';

class AddStudentBinding extends Bindings {
  @override
  void dependencies() {
    // Register the ApiRepository if not already registered
    Get.lazyPut<ApiRepository>(() => ApiRepository(apiProvider: Get.find()));

    // Register AddStudentController with dependency injection
    Get.lazyPut<AddStudentController>(
          () => AddStudentController(apiRepository: Get.find<ApiRepository>()),
    );
  }
}
