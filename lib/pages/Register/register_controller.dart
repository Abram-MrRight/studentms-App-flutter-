import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';

class RegisterController extends GetxController {
  final ApiRepository apiRepository;

  RegisterController({required this.apiRepository});

  final RxBool isLoading = false.obs;

  Future<bool> registerUser(String username, String email, String password, String confirmPassword) async {
    try {
      isLoading.value = true;
      await apiRepository.registerUser(username, email, password, confirmPassword);
      Get.snackbar('Success', 'User registered successfully', backgroundColor: Colors.green);
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: ${e.toString()}', backgroundColor: Colors.red);
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
