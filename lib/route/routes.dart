import 'package:get/get.dart';
import 'package:getx_demo/route/route_view.dart';

class Routes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';
  static const String register = '/register';
  static const String info = '/info';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
    ),
    GetPage(name: Routes.forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen(), children: [
      GetPage(name: Routes.info, page: () => InfoScreen()),
    ]),
  ];
}
