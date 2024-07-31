import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(apiRepository: Get.find<ApiRepository>()));
  }
}
