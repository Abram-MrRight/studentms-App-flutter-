import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Routes/app_pages.dart';
import 'drawer/themeController.dart';
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
        theme: themeController.isDarkTheme.value ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
        builder: EasyLoading.init(),
      );
    });
  }
}
