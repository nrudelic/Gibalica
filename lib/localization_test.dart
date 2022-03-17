import 'package:get/get.dart';

class LocalizationTest extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'test': 'This is localization test in ENGLISH.',
        },
        'hr_HR': {
          'test': 'This is localization test in CROATIAN.',
        }
      };
}