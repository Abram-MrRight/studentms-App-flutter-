import 'package:get/get.dart';
import 'package:studentms_app/pages/Home/home_binding.dart';
import '../pages/Home/home_view.dart';
import '../pages/Home/home.dart';
import '../pages/studentsList/students_binding.dart';
import '../pages/studentsList/students_screen.dart';
part 'app_routes.dart';
class AppPages{

  static final List<GetPage> routes =[
    GetPage(
    name:Routes.HOME,
    page: () => HomeView(),
     binding: HomeBinding(),
  ),

  GetPage(
     name: Routes.STUDENTS,
      page: () => StudentsScreen(),
     binding: StudentsBinding()
  ),

  // GetPage(
  // name: PAGE2, page: () => SecondPage()),
  // )

  ];
}
