// lib/controllers/add_payment_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';

class AddPaymentController extends GetxController {
  final ApiRepository apiRepository;
  final int studentId; // Add studentId as a required parameter

  // Initialize the controller with studentId
  AddPaymentController({required this.apiRepository, required this.studentId});

  var amountController = TextEditingController();
  var dateController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  bool validateFields() {
    if (amountController.text.isEmpty || dateController.text.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      return false;
    }
    try {
      double.parse(amountController.text);
      DateTime.parse(dateController.text);
    } catch (e) {
      errorMessage.value = 'Invalid input';
      return false;
    }
    errorMessage.value = '';
    return true;
  }

  void addPayment() async {
    if (validateFields()) {
      isLoading.value = true;
      try {
        double amount = double.parse(amountController.text);
        DateTime paymentDate = DateTime.parse(dateController.text);

        await apiRepository.addPayment(studentId, amount, paymentDate);
        // Handle success (e.g., show a success message or navigate back)
        Get.snackbar('Success', 'Payment added successfully');
        amountController.clear();
        dateController.clear();
      } catch (e) {
        errorMessage.value = 'Failed to add payment: $e';
      } finally {
        isLoading.value = false;
      }
    }
  }
}
