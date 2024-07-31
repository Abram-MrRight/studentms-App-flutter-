import 'package:get/get.dart';
import 'package:studentms_app/pages/splashScreen/splashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
