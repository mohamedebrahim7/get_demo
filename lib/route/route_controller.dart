import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/route/routes.dart';

import '../user/user_controller.dart';

class RoutingController extends GetxController {
  // Define a variable to store the current screen route in GetStorage
  final _navigationState =
      Routes.onboarding.val('navigationState'); // Default to onboarding screen

  // Method to set the navigation state to login screen
  void goLoginScreen() {
    Get.offNamed(Routes.login); // Navigate back to LoginScreen
    _navigationState.val = Routes.login;
  }

  // Method to set the navigation state to login screen
  void logOut() {
    Get.offNamed(Routes.login);
    Get.find<UserController>().clearUser();
    _navigationState.val = Routes.login;
  }

  // Method to set the navigation state to home screen
  void goHomeAsUser(User user) {
    Get.offNamed(Routes.home); // Navigate back to LoginScreen
    Get.find<UserController>().updateUser(user);
    _navigationState.val = Routes.home;
  }

  // Method to set the navigation state to home screen
  void goHomeScreen() {
    Get.offNamed(Routes.home); // Navigate back to LoginScreen
    _navigationState.val = Routes.home;
  }

  // Method to get the initial route based on the current navigation state
  String getInitialRoute() {
    return _navigationState.val; // Directly return the value from storage
  }
}
