import 'package:get/get.dart';

import '../models/pose_model.dart';

class GameController extends GetxController {
  GameMode gameMode = GameMode.training;
  TrainingCategory? trainingCategory;
  var repeatNumber = 3.obs;
  var gameType = GameType.personal.obs;
  var dayNightCounter = 5.obs;
  var currentRepetitionCounter = 0;
  var repeatGameModeCounter = 5.obs;
  List<BasePose>? possiblePoses;

  GamePlayModes? currentMode;
}

enum GameMode { training, dayAndNight, repeating }

enum TrainingCategory { leftArm, rightArm, lefLeg, rightLeg, squat }

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
