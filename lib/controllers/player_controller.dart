import 'package:get/get.dart';

class PlayerController extends GetxController {
  String? playerName;
  String? avatarAssetPath;
  PositionPlayMode? positionPlayMode;

  bool avatarChosen = false;
  
  var leftHandPref = false.obs; 
  var rightHandPref = false.obs;
  var squatPref = false.obs;
  var leftLegPref = false.obs;
  var rightLegPref = false.obs;
}

enum PositionPlayMode{
  standing,
  sitting
}
