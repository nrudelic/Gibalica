import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsController extends GetxController {
  //Todo set the value from prefrences
  var isLightMode = false.obs;
  var isSoundOn = true.obs;
  var isBiggerText = false.obs;
  var language = Language.Croatian.obs;
  late Box gibalicaBox;
}

enum Language { Croatian, English }
