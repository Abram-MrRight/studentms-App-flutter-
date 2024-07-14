// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/app_pages.dart';
import 'pages/Home/home_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
