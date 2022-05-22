import 'package:get/get.dart';

class GameController extends GetxController {
  GameMode? gameMode;
  TrainingCategory? trainingCategory;
  int? repeatNumber;
  GameType? gameType;
}

enum GameMode{
  training,
  dayAndNight, 
  repeating
}

enum TrainingCategory{
  leftArm,
  rightArm, 
  lefLeg, 
  rightLeg,
  squat
}

enum GameType{
  cards,
  personal
}