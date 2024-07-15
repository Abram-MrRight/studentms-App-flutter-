import 'package:get/get.dart';
import 'package:studentms_app/api/api_provider.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/pages/Home/home_controller.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure ApiProvider is available
    Get.lazyPut<ApiProvider>(() => ApiProvider(httpClient: http.Client()));

    // Ensure ApiRepository is available, depending on ApiProvider
    Get.lazyPut<ApiRepository>(() => ApiRepository(apiProvider: Get.find<ApiProvider>()));

    // Initialize HomeController with ApiRepository
    Get.lazyPut<HomeController>(() => HomeController(apiRepository: Get.find<ApiRepository>()));
  }
}
