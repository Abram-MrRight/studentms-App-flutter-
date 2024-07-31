import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'addPaymentController.dart';

class AddPaymentScreen extends StatelessWidget {
  final int studentId;

  AddPaymentScreen({required this.studentId});

  @override
  Widget build(BuildContext context) {
    final AddPaymentController controller = Get.put(
      AddPaymentController(
        apiRepository: Get.find(),
        studentId: studentId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Payment'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        controller.dateController.text =
                        pickedDate.toString().split(' ')[0];
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: controller.dateController,
                        decoration: InputDecoration(
                          labelText: 'Payment Date (YYYY-MM-DD)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: () {
                      controller.addPayment();
                    },
                    child: Text('Add Payment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  )),
                  Obx(() => controller.errorMessage.value.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                      : SizedBox.shrink()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
