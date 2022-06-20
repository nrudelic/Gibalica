import 'package:get/get.dart';

import '../models/pose_model.dart';

class GameController extends GetxController {
  GameMode gameMode = GameMode.training;
  var repeatNumber = 3.obs;
  var gameType = GameType.personal.obs;
  var dayNightCounter = 5.obs;
  var currentRepetitionCounter = 0;
  var repeatGameModeCounter = 5.obs;
  List<BasePose>? possiblePoses;

  GamePlayModes? currentMode;

  var isPoseFinished = {
   'leftArmUp' : false.obs,
   'leftArmMiddle' : false.obs,
   'leftArmUpAndMiddle' : false.obs,
   'rightArmUp' : false.obs,
   'rightArmMiddle' : false.obs,
   'rightArmUpAndMiddle' : false.obs,
   'leftAndRightArmUp' : false.obs,
   'leftAndRightArmMiddle' : false.obs,
   'leftAndRightArmUpAndMiddleSamePosition' : false.obs,
   'leftAndRightArmUpAndMiddleDiffPosition' : false.obs,
   'leftAndRightArmAll' : false.obs,
   'leftLegUp' : false.obs,
   'rightLegUp' : false.obs,
   'leftAndRightLegUp' : false.obs,
   'legGap' : false.obs,
   'squat' : false.obs,
   'all' : false.obs,
  };

}

enum GameMode { training, dayAndNight, repeating }

enum GameType { cards, personal }

enum GamePlayModes {
  leftArmUp,
  leftArmMiddle,
  leftArmUpAndMiddle,
  rightArmUp,
  rightArmMiddle,
  rightArmUpAndMiddle,
  leftAndRightArmUp,
  leftAndRightArmMiddle,
  leftAndRightArmUpAndMiddleSamePosition,
  leftAndRightArmUpAndMiddleDiffPosition,
  leftAndRightArmAll,
  leftLegUp,
  rightLegUp,
  leftAndRightLegUp,
  legGap,
  squat,
  all,
}

extension GamePlayExtension on GamePlayModes {
  String get toStr {
    switch (this) {
      
      case GamePlayModes.leftArmUp:
        return 'leftArmUp';
      case GamePlayModes.leftArmMiddle:
        return 'leftArmMiddle';
      case GamePlayModes.leftArmUpAndMiddle:
        return 'leftArmUpAndMiddle';
      case GamePlayModes.rightArmUp:
        return 'rightArmUp';
      case GamePlayModes.rightArmMiddle:
        return 'rightArmMiddle';
      case GamePlayModes.rightArmUpAndMiddle:
        return 'rightArmUpAndMiddle';
      case GamePlayModes.leftAndRightArmUp:
        return 'leftAndRightArmUp';
      case GamePlayModes.leftAndRightArmMiddle:
        return 'leftAndRightArmMiddle';
      case GamePlayModes.leftAndRightArmUpAndMiddleSamePosition:
        return 'leftAndRightArmUpAndMiddleSamePosition';
      case GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition:
        return 'leftAndRightArmUpAndMiddleDiffPosition';
      case GamePlayModes.leftAndRightArmAll:
        return 'leftAndRightArmAll';
      case GamePlayModes.leftLegUp:
        return 'leftLegUp';
      case GamePlayModes.rightLegUp:
        return 'rightLegUp';
      case GamePlayModes.leftAndRightLegUp:
        return 'leftAndRightLegUp';
      case GamePlayModes.legGap:
        return 'legGap';
      case GamePlayModes.squat:
        return 'squat';
      case GamePlayModes.all:
        return 'all';
    }
  }
}