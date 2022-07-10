import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsController extends GetxController {
  //Todo set the value from prefrences
  var isNormalContrast = true.obs;
  var isSoundOn = true.obs;
  var isBiggerText = false.obs;
  var language = Language.Croatian.obs;
  late Box gibalicaBox;
  var isUppercase = false.obs;
}

enum Language { Croatian, English }
