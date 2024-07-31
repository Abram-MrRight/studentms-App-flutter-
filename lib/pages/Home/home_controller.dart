import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/Models/responses/studentDetails_response.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  final logger = Logger();

  HomeController({required this.apiRepository});

  var studentsResponse = Rxn<StudentsResponse>();
  final RxBool isLoading = false.obs;

  var totalExpectedFees = 0.obs;
  var totalPayments = 0.obs;
  var totalOutstandingBalances = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudentDetails();
  }

  Future<void> fetchStudentDetails() async {
    isLoading.value = true;
    try {
      var response = await apiRepository.getStudentDetails();
      logger.i('API response: $response');
      if (response != null) {
        studentsResponse.value = response;
        calculateTotals();
      } else {
        // Handle the case where the response is null
        Get.snackbar('Error', 'Failed to fetch student details');
      }
    } catch (e) {
      logger.e('Error fetching student details: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotals() {
    if (studentsResponse.value != null) {
      totalExpectedFees.value = studentsResponse.value!.totalExpectedFees;
      totalPayments.value = studentsResponse.value!.totalPayments;
      totalOutstandingBalances.value = studentsResponse.value!.totalOutstandingBalances;
    }
  }

  String get percentageCollected {
    if (totalExpectedFees.value == 0) return '0%';
    return ((totalPayments.value / totalExpectedFees.value) * 100).toStringAsFixed(2) + '%';
  }
}
