import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studentms_app/pages/drawer/ThemeController.dart';
import 'Routes/app_pages.dart';
import 'api/api_repository.dart';
import 'pages/Home/home_binding.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        theme: themeController.isDarkTheme ? ThemeData.dark() : ThemeData.light(), // Use the public getter
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
        builder: EasyLoading.init(),
      );
    });
  }
}
