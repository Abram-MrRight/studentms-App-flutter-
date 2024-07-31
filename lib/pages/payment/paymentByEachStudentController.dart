import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';

class PaymentsByEachStudentController extends GetxController {
  final int studentId;
  final ApiRepository apiRepository;

  var payments = <Payment>[].obs;

  PaymentsByEachStudentController({
    required this.studentId,
    required this.apiRepository,
  });

  @override
  void onInit() {
    super.onInit();
    fetchPayments();
  }

  void fetchPayments() async {
    try {
      print('Fetching payments for studentId: $studentId'); // Debug print
      var fetchedPayments = await apiRepository.getPaymentsByStudentId(studentId);
      print('Fetched payments: $fetchedPayments'); // Debug print
      payments.assignAll(fetchedPayments);
    } catch (e) {
      print('Error fetching payments: $e'); // Debug print
      Get.snackbar('Error', 'Failed to fetch payments', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
