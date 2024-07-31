import 'package:get/get.dart';
import 'package:studentms_app/pages/payment/paymentByEachStudentController.dart';
import '../../api/api_repository.dart';

class PaymentsByEachStudentBinding extends Bindings {
  @override
  void dependencies() {
    final int studentId = Get.arguments['studentId'];
    Get.lazyPut(() => ApiRepository(apiProvider: Get.find()));
    Get.lazyPut(() => PaymentsByEachStudentController(
      studentId: studentId,
      apiRepository: Get.find(),
    ));
  }
}
