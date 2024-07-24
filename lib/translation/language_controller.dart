import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationController extends GetxController {
  // A box to store the current language code as a string
  final _currentLanguage = 'en'.val('languageCode'); // Default to English

  // Returns the current locale based on the stored language code
  Locale get currentLocale {
    switch (_currentLanguage.val) {
      case 'ar':
        return Locale('ar'); // Arabic
      case 'es':
        return Locale('es'); // Spanish
      default:
        return Locale('en'); // Default to English
    }
  }

  // Switch to English and update the stored value
  void switchToEnglish() {
    _currentLanguage.val = 'en'; // Save English language code
    update(); // Notify listeners about the change
    Get.updateLocale(Locale('en')); // Apply English locale
  }

  // Switch to Arabic and update the stored value
  void switchToArabic() {
    _currentLanguage.val = 'ar'; // Save Arabic language code
    update(); // Notify listeners about the change
    Get.updateLocale(Locale('ar')); // Apply Arabic locale
  }

  // Switch to Spanish and update the stored value
  void switchToSpanish() {
    _currentLanguage.val = 'es'; // Save Spanish language code
    update(); // Notify listeners about the change
    Get.updateLocale(Locale('es')); // Apply Spanish locale
  }
}
