import 'package:get/get.dart';
import 'package:studentms_app/pages/payment/paymentController.dart';

import '../../api/api_repository.dart';

class PaymentSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository(apiProvider: Get.find()));
    Get.lazyPut(() => PaymentSummaryController(apiRepository: Get.find()));
  }
}
