import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'language_controller.dart';
import 'my_translations.dart';

// Entry point of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  Get.put(TranslationController()); // Initialize TranslationController
  runApp(MyApp()); // Run the app
}

// Main app widget
class MyApp extends StatelessWidget {
  final TranslationController translationController = Get.find();

  MyApp({super.key}); // Get the TranslationController instance

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: translationController
          .currentLocale, // Set the locale based on controller
      translations: AppTranslations(), // Load translations
      fallbackLocale: const Locale('en'), // Fallback locale if none is provided
      home: TranslationSwitcherScreen(), // Set the initial screen
    );
  }
}

class TranslationSwitcherScreen extends StatelessWidget {
  TranslationSwitcherScreen({super.key});
  final TranslationController translationController =
      Get.put(TranslationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Translation Switcher')),
      // AppBar title
      body: <TranslationController>(
        builder: (controller) {
          log("🟡🟡🟡 rebuild 🟡🟡🟡");

          return Center(
            child: Column(
              children: <Widget>[
                // Radio button for English

                Text('hello'.tr),
                SizedBox(height: 10),
                RadioListTile<String>(
                  title: Text('English'),
                  value: 'en',
                  groupValue: controller.currentLocale.languageCode,
                  onChanged: (String? value) {
                    translationController
                        .switchToEnglish(); // Switch to English
                  },
                ),
                // Radio button for Arabic
                RadioListTile<String>(
                  title: Text('Arabic'),
                  value: 'ar',
                  groupValue: controller.currentLocale.languageCode,
                  onChanged: (String? value) {
                    translationController.switchToArabic(); // Switch to Arabic
                  },
                ),
                // Radio button for Spanish
                RadioListTile<String>(
                  title: Text('Spanish'),
                  value: 'es',
                  groupValue: controller.currentLocale.languageCode,
                  onChanged: (String? value) {
                    translationController
                        .switchToSpanish(); // Switch to Spanish
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
