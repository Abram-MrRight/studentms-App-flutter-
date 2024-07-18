import 'package:get/get.dart';
import 'package:studentms_app/pages/Home/home_binding.dart';
import 'package:studentms_app/pages/studentsList/NewStudent/add_student.dart';
import '../pages/Home/home_view.dart';
import '../pages/Home/home.dart';
import '../pages/studentsList/NewStudent/add_student_binding.dart';
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
      binding: StudentsBinding(),
    ),
    GetPage(
      name: Routes.ADD,
      page: () => AddStudentScreen(),
      binding: AddStudentBinding(),
    ),

  ];
}
