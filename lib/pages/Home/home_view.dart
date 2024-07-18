import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/Routes/app_pages.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/pages/Home/home_controller.dart';
import 'package:studentms_app/pages/studentsList/students_screen.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController(apiRepository: Get.find<ApiRepository>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Student Finances',
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        elevation: 12,
        backgroundColor: const Color.fromARGB(255, 158, 146, 240),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.fetchStudentDetails();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF9688e5),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                Get.toNamed(Routes.PRIVACY); // Navigate to Privacy Policy page
              },
            ),
            ListTile(
              leading: const Icon(Icons.gavel),
              title: const Text('Legal Notice'),
              onTap: () {
                Get.toNamed(Routes.LEGAL); // Navigate to Legal Notice page
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Terms of Service'),
              onTap: () {
                Get.toNamed(Routes.TERMS); // Navigate to Terms of Service page
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.studentsResponse.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60), // Add space at the top
              _buildCard(
                title: 'Expected Amount',
                value: '${controller.totalExpectedFees}',
              ),
              const SizedBox(height: 10),
              _buildCard(
                title: 'Total Collected',
                value: '${controller.totalPayments}',
              ),
              const SizedBox(height: 10),
              _buildCard(
                title: 'Outstanding Balances',
                value: '${controller.totalOutstandingBalances}',
              ),
              const SizedBox(height: 10),
              _buildCard(
                title: 'Percentage Collected',
                value: controller.percentageCollected,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const StudentsListView());
                },
                style: ElevatedButton.styleFrom(
                 backgroundColor: const Color.fromARGB(255, 158, 146, 240),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                child: const Text('Students'),
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
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
