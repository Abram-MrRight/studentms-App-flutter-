import 'package:get/get.dart';
import 'package:studentms_app/pages/Home/home_binding.dart';
import '../pages/Home/home_view.dart';
import '../pages/Home/home.dart';
import '../pages/legal_notice_screen.dart';
import '../pages/privacy_policy_screen.dart';
import '../pages/studentsList/edit_student_screen.dart';
import '../pages/studentsList/student_details_screen.dart';
import '../pages/studentsList/students_binding.dart';
import '../pages/studentsList/students_screen.dart';
import '../pages/terms_screen.dart';
part 'app_routes.dart';
class AppPages{

  static final List<GetPage> routes =[
    GetPage(
    name:Routes.HOME,
    page: () => HomeView(),
     binding: HomeBinding(),
      children: [
        GetPage(name: Routes.PRIVACY, page: () => const PrivacyPolicyScreen()),
        GetPage(name: Routes.LEGAL, page: () => const LegalNoticeScreen()),
        GetPage(name: Routes.TERMS, page: () => const TermsServiceScreen()),
      ]
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
