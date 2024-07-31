import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Routes/app_pages.dart';
import '../Login/login_controller.dart';
import '../Login/login_screen.dart';
import 'ThemeController.dart';

class BuildDrawer extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  final LoginController loginController = Get.find<LoginController>();

  BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Obx(() {
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    loginController.userName.value ?? 'Guest',
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    loginController.userEmail.value ?? 'No Email',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      (loginController.userName.value?.isNotEmpty ?? false)
                          ? loginController.userName.value!.substring(0, 1)
                          : 'U',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(217, 130, 230, 125),
                  ),
                );
              }),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Student Finances'),
                onTap: () {
                  Get.toNamed(Routes.HOME);
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payments'),
                onTap: () {
                  // Handle Payments navigation
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Student List'),
                onTap: () {
                  Get.toNamed(Routes.STUDENTS);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Terms and Conditions'),
                onTap: () async {
                  const url = 'https://www.termsfeed.com/live/4b30125d-101d-4762-878b-0a9f0f31f307';
                  try {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      Get.snackbar('Error', 'Could not launch $url');
                    }
                  } catch (e) {
                    Get.snackbar('Error', 'An error occurred while launching $url');
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Log out logic
                  Get.offAll(() => LoginScreen(title: ''));
                },
              ),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              children: [
                Icon(Icons.light_mode, color: Colors.grey),
                Obx(() {
                  return Switch(
                    value: themeController.isDarkTheme,
                    onChanged: (value) {
                      themeController.toggleTheme();
                    },
                    activeColor: Colors.grey,
                  );
                }),
                Icon(Icons.dark_mode, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
