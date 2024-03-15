import 'package:decoders/routes/routes_name.dart';
import 'package:decoders/view/add_screen/add_view.dart';
import 'package:decoders/view/email_verification.dart';
import 'package:decoders/view/home_view.dart';
import 'package:decoders/view/auth/login_view.dart';
import 'package:decoders/view/profile.dart';
import 'package:decoders/view/registration_view.dart';
import 'package:decoders/view/splash_screen.dart';
import 'package:decoders/view/account_screen.dart';
import 'package:decoders/view/users_details.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
          name: RouteName.emailVerification,
          page: () => const EmailVerification(),
        ),
        GetPage(
          name: RouteName.studentProfile,
          page: () => const StudentProfile(),
        ),
        GetPage(
          name: RouteName.loginVIew,
          page: () => const LoginView(),
        ),
        GetPage(
          name: RouteName.splashView,
          page: () =>  AccountScreen(),
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
        ),
      ];
}
