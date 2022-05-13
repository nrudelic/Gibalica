import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/models/pose_model.dart';

class PoseController extends GetxController {
  final currentPose = 'Poza nije prepoznata'.obs;
  BasePose? wantedPose;

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
    BasePose.leftLegGap : 0.0,
    BasePose.leftLegUp : 0.0,
    BasePose.rightLegNeutral : 0.0,
    BasePose.rightLegGap : 0.0,
    BasePose.rightLegUp : .00
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
}
