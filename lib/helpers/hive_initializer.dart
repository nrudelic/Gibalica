
import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gibalica/main.dart';
import 'package:hive/hive.dart';

import '../controllers/camera_view_controller.dart';
import '../controllers/device_controller.dart';
import '../controllers/game_controller.dart';
import '../controllers/player_controller.dart';
import '../controllers/pose_controller.dart';
import '../controllers/settings_controller.dart';


Future<void> getSettingsFromBox() async {
  var poseController = Get.find<PoseController>();
  var deviceController = Get.find<DeviceController>();
  var cameraViewController = Get.find<CameraViewController>();
  var playerController = Get.find<PlayerController>();
  var gameController = Get.find<GameController>();
  var settingsController = Get.find<SettingsController>();

  var box = await Hive.openBox('gibalicaBox');
  settingsController.gibalicaBox = box;

  isOnboardingFinished = box.get("onboardingFinished", defaultValue: false);
  if (isOnboardingFinished) {
    playerController.avatarChosen = true;
  }
  playerController.playerName = box.get("playerName", defaultValue: "");
  playerController.avatarAssetPath.value = box.get("avatarAssetPath", defaultValue: "assets/Avatar_1_Girl1.svg");
  var playingPosition = box.get("positionPlayMode", defaultValue: "Standing");
  if (playingPosition == "Standing") {
    playerController.positionPlayMode = PositionPlayMode.standing;
  } else {
    playerController.positionPlayMode = PositionPlayMode.sitting;
  }

  playerController.leftHandPref.value = box.get("leftHandPref", defaultValue: true);
  playerController.rightHandPref.value = box.get("rightHandPref", defaultValue: true);
  playerController.squatPref.value = box.get("squatPref", defaultValue: true);
  playerController.leftLegPref.value = box.get("leftLegPref", defaultValue: true);
  playerController.rightLegPref.value = box.get("rightLegPref", defaultValue: true);

  settingsController.isNormalContrast.value = box.get('isNormalContrast', defaultValue: true);
  settingsController.isBiggerText.value = box.get('isBiggetText', defaultValue: false);
  settingsController.isSoundOn.value = box.get('isSoundOn', defaultValue: true);

  var language = box.get("language", defaultValue: "Croatian");
  var typeOfLetters = box.get("uppercaseLetters", defaultValue: false);
  settingsController.isUppercase.value = typeOfLetters;
  if (language == "Croatian" && typeOfLetters) {
    var locale = const Locale('HR', 'HR');
    Get.updateLocale(locale);
    settingsController.language.value = Language.Croatian;
  } else if (language == "English" && typeOfLetters) {
    var locale = const Locale('EN', 'US');
    
    Get.updateLocale(locale);
    settingsController.language.value = Language.English;
  } else if (language == "Croatian" && !typeOfLetters) {
    var locale = const Locale('hr', 'HR');
    Get.updateLocale(locale);
    settingsController.language.value = Language.Croatian;
  } else {
    settingsController.language.value = Language.English;
    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
  }

  poseController.posePerformance[GamePlayModes.leftArmUp] = box.get("leftArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftArmMiddle] = box.get("leftArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftArmUpAndMiddle] = box.get("leftArmUpAndMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmUp] = box.get("rightArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmMiddle] = box.get("rightArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmUpAndMiddle] = box.get("rightArmUpAndMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUp] = box.get("leftAndRightArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmMiddle] = box.get("leftAndRightArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleSamePosition] = box.get("leftAndRightArmUpAndMiddleSamePosition", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition] = box.get("leftAndRightArmUpAndMiddleDiffPosition", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmAll] = box.get("leftAndRightArmAll", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftLegUp] = box.get("leftLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightLegUp] = box.get("rightLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightLegUp] = box.get("leftAndRightLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.legGap] = box.get("legGap", defaultValue: false);
  poseController.posePerformance[GamePlayModes.squat] = box.get("squat", defaultValue: false);
  poseController.posePerformance[GamePlayModes.all] = box.get("all", defaultValue: false);

  gameController.isPoseFinished['leftArmUp']!.value = box.get("leftArmUp", defaultValue: false);
  gameController.isPoseFinished['leftArmMiddle']!.value = box.get("leftArmMiddle", defaultValue: false);
  gameController.isPoseFinished['leftArmUpAndMiddle']!.value = box.get("leftArmUpAndMiddle", defaultValue: false);
  gameController.isPoseFinished['rightArmUp']!.value = box.get("rightArmUp", defaultValue: false);
  gameController.isPoseFinished['rightArmMiddle']!.value = box.get("rightArmMiddle", defaultValue: false);
  gameController.isPoseFinished['rightArmUpAndMiddle']!.value = box.get("rightArmUpAndMiddle", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUp']!.value = box.get("leftAndRightArmUp", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmMiddle']!.value = box.get("leftAndRightArmMiddle", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUpAndMiddleSamePosition']!.value = box.get("leftAndRightArmUpAndMiddleSamePosition", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUpAndMiddleDiffPosition']!.value = box.get("leftAndRightArmUpAndMiddleDiffPosition", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmAll']!.value = box.get("leftAndRightArmAll", defaultValue: false);
  gameController.isPoseFinished['leftLegUp']!.value = box.get("leftLegUp", defaultValue: false);
  gameController.isPoseFinished['rightLegUp']!.value = box.get("rightLegUp", defaultValue: false);
  gameController.isPoseFinished['leftAndRightLegUp']!.value = box.get("leftAndRightLegUp", defaultValue: false);
  gameController.isPoseFinished['legGap']!.value = box.get("legGap", defaultValue: false);
  gameController.isPoseFinished['squat']!.value = box.get("squat", defaultValue: false);
  gameController.isPoseFinished['all']!.value = box.get("all", defaultValue: false);
}
