import 'package:get/get.dart';
import 'package:studentms_app/pages/Home/home_binding.dart';
import 'package:studentms_app/pages/Login/login_screen.dart';
import 'package:studentms_app/pages/Register/register_screen.dart';
import 'package:studentms_app/pages/payment/addPayment/addPaymentBinding.dart';
import 'package:studentms_app/pages/payment/addPayment/addPaymentScreen.dart';
import 'package:studentms_app/pages/payment/paymentScreen.dart';
import 'package:studentms_app/pages/splashScreen/splashBinding.dart';
import 'package:studentms_app/pages/splashScreen/splashScreen.dart';
import 'package:studentms_app/pages/studentsList/NewStudent/add_student.dart';
import '../pages/Home/home_view.dart';
import '../pages/Login/login_binding.dart';
import '../pages/Register/register_binding.dart';
import '../pages/payment/paymenEachBinding.dart';
import '../pages/payment/paymentBinding.dart';
import '../pages/payment/paymentByEachStudentScreen.dart';
import '../pages/studentsList/edit_student_screen.dart';
import '../pages/studentsList/student_details_screen.dart';
import '../pages/studentsList/NewStudent/add_student_binding.dart';
import '../pages/studentsList/students_binding.dart';
import '../pages/studentsList/students_screen.dart';
part 'app_routes.dart';
class AppPages{

  static final List<GetPage> routes =[
    GetPage(
    name:Routes.SPLASH,
    page: () => SplashScreen(title: 'Splash',),
     binding: SplashBinding(),
  ),
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
    GetPage(name: Routes.EDIT_STUDENT, page: () => EditStudentScreen()),
    GetPage(
      name: Routes.STUDENTS,
      page: () => StudentsListView(),
      binding: StudentsBinding(),
    ),
    GetPage(
      name: Routes.ADD,
      page: () => AddStudentScreen(),
      binding: AddStudentBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentScreen(),
      binding: PaymentSummaryBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(title: 'Login'),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.PAYMENTSEACH,
      page: () => PaymentsScreenByEachStudent(),
      binding: PaymentsByEachStudentBinding(),
    ),
    GetPage(
      name: Routes.ADD_PAYMENT,
      page: () => AddPaymentScreen(studentId: Get.arguments),
      binding: AddPaymentBinding(),
    ),
  ];
}
