// lib/screens/payments_screen_by_each_student.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/payment/paymentByEachStudentController.dart';

import 'addPayment/addPaymentScreen.dart';

class PaymentsScreenByEachStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve studentId from arguments
    final Map<String, dynamic>? arguments = Get.arguments;
    final int studentId = arguments?['studentId'] ?? 0;

    // Ensure studentId is not 0 before proceeding
    if (studentId == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Payments'),
          backgroundColor: Colors.green,
        ),
        body: Center(child: Text('Invalid student ID')),
      );
    }

    final PaymentsByEachStudentController controller = Get.put(
      PaymentsByEachStudentController(
        studentId: studentId,
        apiRepository: Get.find(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
        backgroundColor: Colors.green,
      ),
      body: Obx(() {
        if (controller.payments.isEmpty) {
          return Center(child: Text('No payments made for this student.'));
        }
        return ListView.builder(
          itemCount: controller.payments.length,
          itemBuilder: (context, index) {
            final payment = controller.payments[index];
            return ListTile(
              title: Text('Amount: ${payment.amount}'),
              subtitle: Text('Date: ${payment.paymentDate}'),
              leading: Icon(Icons.payment, color: Colors.green),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPaymentScreen(studentId: studentId));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
