import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello',
        },
        'ar': {
          'hello': 'مرحبا',
        },
        'es': {
          'hello': 'Hola',
        },
      };
}
