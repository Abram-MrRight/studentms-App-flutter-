import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/pages/payment/paymentController.dart';
import 'package:studentms_app/api/api_repository.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentSummaryController controller = Get.put(
    PaymentSummaryController(apiRepository: Get.find<ApiRepository>()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
        backgroundColor: const Color.fromARGB(217, 104, 228, 98),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.payments.isEmpty) {
          return Center(
            child: Text(
              'No payments found.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: controller.payments.length,
            itemBuilder: (context, index) {
              final payment = controller.payments[index];
              return Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  title: Text(
                    'Payment ID: ${payment.paymentId}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount: \$${payment.amount}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Date: ${payment.paymentDate}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Student ID: ${payment.studentId}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.payment,
                    color: Colors.green,
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
