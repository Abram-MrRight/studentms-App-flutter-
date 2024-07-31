// lib/bindings/add_payment_binding.dart

import 'package:get/get.dart';
import '../../../api/api_repository.dart';

class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository(apiProvider: Get.find()));
    // Do not add AddPaymentController here directly
  }
}
