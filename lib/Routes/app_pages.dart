import 'package:get/get.dart';
import 'package:studentms_app/pages/Home/home_binding.dart';
import '../pages/Home/home_view.dart';
import '../pages/Home/home.dart';
import '../pages/studentsList/edit_student_screen.dart';
import '../pages/studentsList/student_details_screen.dart';
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
      page: () => const StudentsListView(),
     binding: StudentsBinding()
  ),
    GetPage(name: Routes.STUDENT_DETAILS, page: () => StudentDetailsScreen()),
    GetPage(name: Routes.EDIT_STUDENT, page: () => EditStudentScreen())
  ];
}
