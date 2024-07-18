import 'package:get/get.dart';
import 'package:studentms_app/api/api.dart';
import 'package:studentms_app/pages/studentsList/students_controller.dart';
import 'package:studentms_app/api/api_provider.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'students_controller.dart';
import 'package:http/http.dart' as http;

class StudentsBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<StudentsController>(
       ()=> StudentsController(apiRepository: Get.find<ApiRepository>()));
    Get.lazyPut<ApiProvider>(() => ApiProvider(httpClient: http.Client()));
    Get.lazyPut<ApiRepository>(() => ApiRepository(apiProvider: Get.find<ApiProvider>()));
    Get.lazyPut<StudentsController>(() => StudentsController(apiRepository: Get.find<ApiRepository>()));
  }
}
