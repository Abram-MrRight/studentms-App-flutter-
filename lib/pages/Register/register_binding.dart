import 'package:get/get.dart';
import 'package:studentms_app/pages/Register/register_controller.dart';
import 'package:studentms_app/api/api_provider.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:http/http.dart' as http;

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider(httpClient: http.Client()));
    Get.lazyPut<ApiRepository>(() => ApiRepository(apiProvider: Get.find<ApiProvider>()));
    Get.lazyPut<RegisterController>(() => RegisterController(apiRepository: Get.find<ApiRepository>()));
  }
}
