import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';

class PoseController extends GetxController {
  final currentPose = 'Poza nije prepoznata'.obs;
  BasePose? wantedPose;
  DayNightEnum? wantedDayNightPosition;
  
  ValueNotifier<bool> playAnimation = ValueNotifier<bool>(false);

  int poseHoldingCounter = 0;
  var onboardingCompleted = false;

  var poseCalculationDict = {
    BasePose.leftArmNeutral : 0.0,
    BasePose.leftArmMiddle : 0.0,
    BasePose.leftArmUp : 0.0,
    BasePose.rightArmNeutral : 0.0,
    BasePose.rightArmMiddle : 0.0,
    BasePose.rightArmUp : 0.0,
    BasePose.leftLegNeutral : 0.0,
    BasePose.leftLegUp : 0.0,
    BasePose.rightLegNeutral : 0.0,
    BasePose.rightLegUp : .0
  };

  var dayNightDict = {
    DayNightEnum.day : 0.0,
    DayNightEnum.night : 0.0
  };

var poseCalculationOnboardingDict = {
    BasePose.leftArmNeutral : 0.0,
    BasePose.rightArmNeutral : 0.0,
    BasePose.leftLegNeutral : 0.0,
    BasePose.rightLegNeutral : 0.0,
  };
  var frameDelta = 0.06;

  updateCurrentPose(String pose) {
    currentPose(pose);
  }

  updateLottieStatus(bool status){
    playAnimation.value = status;
  }

  setonboardingCompleted(var value){
    onboardingCompleted = value;
  }

  double? yLeftShoulder;
  double? yRightShoulder;

  var posePerformance = {
    GamePlayModes.leftArmUp : false,
    GamePlayModes.leftArmMiddle : false,
    GamePlayModes.leftArmUpAndMiddle : false,
    GamePlayModes.rightArmUp : false,
    GamePlayModes.rightArmMiddle : false,
    GamePlayModes.rightArmUpAndMiddle : false,
    GamePlayModes.leftAndRightArmUp : false,
    GamePlayModes.leftAndRightArmMiddle : false,
    GamePlayModes.leftAndRightArmUpAndMiddleSamePosition : false,
    GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition : false,
    GamePlayModes.leftAndRightArmAll : false,
    GamePlayModes.leftLegUp : false,
    GamePlayModes.rightLegUp : false,
    GamePlayModes.leftAndRightLegUp : false,
    GamePlayModes.legGap : false,
    GamePlayModes.squat : false,
    GamePlayModes.all : false
  };
}
