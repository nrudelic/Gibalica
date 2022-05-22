import 'package:get/get.dart';

class PlayerController extends GetxController {
  String? playerName;
  String? avatarAssetPath;
  PositionPlayMode? positionPlayMode;
  bool leftHandPref = false; 
  bool rightHandPref = false;
  bool squatPref = false;
  bool leftLegPref = false;
  bool rightLegPref = false;
}

enum PositionPlayMode{
  standing,
  sitting
}