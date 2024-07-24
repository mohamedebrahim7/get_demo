/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/route/routes.dart';

import 'app_state_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AppStateController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppStateController appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: appStateController.getInitialRoute(),
      getPages: AppPages.pages,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final AppStateController appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            appStateController.goLoginScreen();
          },
          child: Text('Go to Login'),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final AppStateController appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                appStateController.goHomeScreenAsGuest();
              },
              child: Text('Go to Home as guest '),
            ),
            ElevatedButton(
              onPressed: () {
                appStateController.goHomeScreenAsUser();
              },
              child: Text('Go to Home as user '),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppStateController appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            Text('Welcome Home!'),
            Text(appStateController.getUser().toString()),
          ],
        ),
      ),
    );
  }
}
*/
