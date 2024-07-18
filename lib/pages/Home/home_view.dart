import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/api/api_repository.dart';
import 'package:studentms_app/drawer/Drawer.dart';
import 'package:studentms_app/pages/Home/home_controller.dart';
import 'package:studentms_app/pages/studentsList/students_screen.dart';
import '../../Routes/app_pages.dart';

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
        backgroundColor: const Color.fromARGB(217, 104, 228, 98),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Implement refresh functionality here
            },
          ),
        ],
      ),
      drawer: const BuildDrawer(),
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
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(217, 104, 228, 98),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Students',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_sharp),
              label: 'Payments',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Get.toNamed(Routes.HOME); // Ensure you have defined Routes.HOME
                break;
              case 1:
                Get.toNamed(Routes.STUDENTS);
                break;
              case 2:
                Get.toNamed(Routes.PAYMENT); // Ensure you have defined Routes.SETTINGS
                break;
            }
          },
        ),
      ),
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
