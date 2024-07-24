import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/route/route_controller.dart';
import 'package:getx_demo/route/routes.dart';
import 'package:getx_demo/user/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  Get.put(RoutingController());
  Get.put(UserController()); // Instantiate RoutingController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RoutingController routingController = Get.find();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: routingController
          .getInitialRoute(), // Set initial route based on stored state
      getPages: AppPages.pages,
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final RoutingController routingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to the Onboarding Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                routingController.goLoginScreen();
                Get.offNamed(Routes.login); // Navigate to LoginScreen
              },
              child: Text('Go to Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final RoutingController routingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //create random int for id
                int id = new DateTime.now().millisecondsSinceEpoch;
                routingController.goHomeAsUser(
                    User(id: "1", name: "John", token: id.toString()));
                Get.offNamed(Routes.home); // Navigate to HomeScreen
              },
              child: Text('Login as user '),
            ),
            ElevatedButton(
              onPressed: () {
                routingController.goHomeScreen();
                Get.offNamed(Routes.home); // Navigate to HomeScreen
              },
              child: Text('Login as guest '),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    Routes.forgotPassword); // Navigate to ForgotPasswordScreen
              },
              child: Text('Forgot Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    Routes.register); // Navigate to ForgotPasswordScreen
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Text('Register Screen'),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: Center(
        child: GetBuilder<UserController>(
          builder: (controller) => Text(controller.user.toString()),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Center(
        child: Text('Forgot Password Screen'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final RoutingController routingController = Get.find();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<UserController>(
              builder: (controller) => Text(controller.isUser.toString()),
            ),
            Text('Home Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                routingController.logOut();
              },
              child: Text('log out'),
            ),
            ElevatedButton(
              onPressed: () {
                userController.isUser
                    ? Get.toNamed("${Routes.home}${Routes.info}")
                    : Get.snackbar("only users", "go make account");
              },
              child: Text('go info screen'),
            ),
          ],
        ),
      ),
    );
  }
}
