// lib/pages/payment/paymentController.dart

import 'package:get/get.dart';
import '../../api/api_repository.dart';

class PaymentSummaryController extends GetxController {
  final ApiRepository apiRepository;

  PaymentSummaryController({required this.apiRepository});

  var payments = <Payment>[].obs;

  @override
  void onInit() {
    fetchPayments();
    super.onInit();
  }

  void fetchPayments() async {
    final response = await apiRepository.getPayments();
    final paymentList = response['payments'] as List<dynamic>;
    payments.value = paymentList.map((json) => Payment.fromJson(json)).toList();
  }
}
