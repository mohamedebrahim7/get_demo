import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/screenA', page: () => ScreenA()),
    GetPage(name: '/screenB', page: () => ScreenB()),
    GetPage(name: '/screenC', page: () => ScreenC()),
  ];

  // Method to get the last visited screen or a random initial route
  static Future<String> getInitialRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastScreen = prefs.getString('lastScreen');

    if (lastScreen != null) {
      return lastScreen;
    }

    final screens = ['/screenA', '/screenB', '/screenC'];
    return screens.first;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute = await AppRoutes.getInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Random Initial Screen',
      initialRoute: initialRoute, // Set the initial route
      getPages: AppRoutes.routes,
    );
  }
}

class ScreenC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _saveScreen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastScreen', '/screenC');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Screen C')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _saveScreen();
            // Navigate to another screen if needed
          },
          child: Text('This is Screen C'),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _saveScreen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastScreen', '/screenC');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _saveScreen();
            // Navigate to another screen if needed
          },
          child: Text('This is Screen B'),
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _saveScreen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastScreen', '/screenB');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _saveScreen();
            Get.toNamed('/screenB');
            // Navigate to another screen if needed
          },
          child: Text('This is Screen A'),
        ),
      ),
    );
  }
}
