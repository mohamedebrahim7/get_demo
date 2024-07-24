import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.currentThemeMode,
      home: ThemeSwitcherScreen(),
    );
  }
}

class ThemeSwitcherScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Switcher')),
      body: GetBuilder<ThemeController>(
        builder: (controller) {
          return Column(
            children: <Widget>[
              RadioListTile<ThemeMode>(
                title: Text('Light Theme'),
                value: ThemeMode.light,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController.switchToLightTheme();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('Dark Theme'),
                value: ThemeMode.dark,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController.switchToDarkTheme();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('System Theme'),
                value: ThemeMode.system,
                groupValue: controller.currentThemeMode,
                onChanged: (ThemeMode? value) {
                  themeController.switchToSystemTheme();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class ThemeController extends GetxController {
  final GetStorage _box = GetStorage();
  final _key = 'themeMode';

  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode {
    String? savedThemeMode = _box.read(_key);
    if (savedThemeMode != null) {
      switch (savedThemeMode) {
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    }
    return _currentThemeMode;
  }

  void _saveThemeMode(String themeMode) {
    _box.write(_key, themeMode);
  }

  void switchToLightTheme() {
    if (_currentThemeMode == ThemeMode.light) return;
    _currentThemeMode = ThemeMode.light;
    update();
    Get.changeThemeMode(ThemeMode.light);
    _saveThemeMode('light');
  }

  void switchToDarkTheme() {
    if (_currentThemeMode == ThemeMode.dark) return;
    _currentThemeMode = ThemeMode.dark;
    update();
    Get.changeThemeMode(ThemeMode.dark);
    _saveThemeMode('dark');
  }

  void switchToSystemTheme() {
    if (_currentThemeMode == ThemeMode.system) return;
    _currentThemeMode = ThemeMode.system;
    update();
    Get.changeThemeMode(ThemeMode.system);
    _saveThemeMode('system');
  }
}
