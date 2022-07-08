import 'package:get/get.dart';

class PlayerController extends GetxController {
  String? playerName;
  var avatarAssetPath = "assets/Avatar_1_Girl1.svg".obs;
  PositionPlayMode? positionPlayMode;
  var exerciseProgram = ExerciseProgram.all.obs;
  bool avatarChosen = false;
  
  var leftHandPref = true.obs; 
  var rightHandPref = true.obs;
  var squatPref = true.obs;
  var leftLegPref = true.obs;
  var rightLegPref = true.obs;
}

enum PositionPlayMode{
  standing,
  sitting
}

enum ExerciseProgram{
  all,
  special
}
