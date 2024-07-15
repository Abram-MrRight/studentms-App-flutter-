import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/pages/Home/home_controller.dart';
import 'package:studentms_app/pages/studentsList/students_screen.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController(apiRepository: Get.find<ApiRepository>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Student Finances',
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        elevation: 12,
        backgroundColor: Color.fromARGB(255, 158, 146, 240),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Implement refresh functionality here
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.studentsResponse.value == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 60), // Add space at the top
              _buildCard(
                title: 'Expected Amount',
                value: '${controller.totalExpectedFees}',
              ),
              SizedBox(height: 10),
              _buildCard(
                title: 'Total Collected',
                value: '${controller.totalPayments}',
              ),
              SizedBox(height: 10),
              _buildCard(
                title: 'Outstanding Balances',
                value: '${controller.totalOutstandingBalances}',
              ),
              SizedBox(height: 10),
              _buildCard(
                title: 'Percentage Collected',
                value: controller.percentageCollected,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => StudentsScreen());
                },
                child: Text('Students'),
                style: ElevatedButton.styleFrom(
                 backgroundColor: Color.fromARGB(255, 158, 146, 240),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCard({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 14,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
