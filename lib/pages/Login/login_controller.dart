import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Routes/app_pages.dart';
import '../../api/api_repository.dart';

class LoginController extends GetxController {
  final ApiRepository apiRepository;
  final logger = Logger();

  LoginController({required this.apiRepository});

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxString token = ''.obs;
  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous error messages

    try {
      final response = await apiRepository.loginUser(email, password);

      if (response == null) {
        throw Exception('Response is null');
      }

     // logger.d('API response: $response'); // Debug

      if (response['status'] == 'Success') {
        userName.value = response['username'] ?? 'Guest';
        userEmail.value = response['email'] ?? 'guest@example.com';
        print('🐛 Username: ${userName.value}');
        print('🐛 User email: ${userEmail.value}');
        Get.offAllNamed(Routes.HOME);
      } else {
        // Handle failed login with an appropriate message
        errorMessage.value = response['message'] ?? 'Login failed. Please try again.';
        Get.snackbar('Login Error', errorMessage.value,
            backgroundColor: Colors.red,
            colorText: Colors.white
        );
      }
    } catch (error) {
      // Handle general errors
      logger.e('Login error: $error');
      errorMessage.value = 'An error occurred. Please try again.';
      Get.snackbar('Login Error', errorMessage.value,
          backgroundColor: Colors.red,
          colorText: Colors.white
      );
    } finally {
      isLoading.value = false; // Set loading to false when done
    }
  }

}
