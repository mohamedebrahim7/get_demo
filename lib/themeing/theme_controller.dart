import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Controller for managing theme mode with persistence
class ThemeController extends GetxController {
  // A box to store the current theme mode as a string
  final _currentThemeMode =
      ThemeMode.system.name.val('themeMode'); // Default to system theme mode

  // Returns the current ThemeMode based on the stored string value
  ThemeMode get currentThemeMode {
    switch (_currentThemeMode.val) {
      case 'light':
        return ThemeMode.light; // Return light theme
      case 'dark':
        return ThemeMode.dark; // Return dark theme
      default:
        return ThemeMode.system; // Default to system theme
    }
  }

  // Switch to light theme and update the stored value
  void switchToLightTheme() {
    _currentThemeMode.val = ThemeMode.light.name; // Save light theme as string
    update(); // Notify listeners about the change
    Get.changeThemeMode(ThemeMode.light); // Apply light theme
  }

  // Switch to dark theme and update the stored value
  void switchToDarkTheme() {
    _currentThemeMode.val = ThemeMode.dark.name; // Save dark theme as string
    update(); // Notify listeners about the change
    Get.changeThemeMode(ThemeMode.dark); // Apply dark theme
  }

  // Switch to system theme and update the stored value
  void switchToSystemTheme() {
    _currentThemeMode.val =
        ThemeMode.system.name; // Save system theme as string
    update(); // Notify listeners about the change
    Get.changeThemeMode(ThemeMode.system); // Apply system theme
  }
}

// Screen to switch between different themes using radio buttons
class ThemeSwitcherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        Get.put(ThemeController()); // Initialize the controller

    return Scaffold(
      appBar: AppBar(title: Text('Theme Switcher')), // AppBar title
      body: <ThemeController>(
        builder: (controller) {
          log("🟢🟢🟢 rebuild 🟢🟢🟢"); // Log rebuild events
          return Column(
            children: <Widget>[
              // Radio button for light theme
              RadioListTile<ThemeMode>(
                title: Text('Light Theme'),
                value: ThemeMode.light,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController.switchToLightTheme(); // Switch to light theme
                },
              ),
              // Radio button for dark theme
              RadioListTile<ThemeMode>(
                title: Text('Dark Theme'),
                value: ThemeMode.dark,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController.switchToDarkTheme(); // Switch to dark theme
                },
              ),
              // Radio button for system theme
              RadioListTile<ThemeMode>(
                title: Text('System Theme'),
                value: ThemeMode.system,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController
                      .switchToSystemTheme(); // Switch to system theme
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// Entry point of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  Get.put(ThemeController()); // Initialize ThemeController
  runApp(MyApp()); // Run the app
}

// Main app widget
class MyApp extends StatelessWidget {
  final ThemeController themeController =
      Get.find(); // Get the ThemeController instance

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(), // Light theme configuration
      darkTheme: ThemeData.dark(), // Dark theme configuration
      themeMode: themeController
          .currentThemeMode, // Set the theme mode based on controller
      home: ThemeSwitcherScreen(), // Set the initial screen
    );
  }
}
