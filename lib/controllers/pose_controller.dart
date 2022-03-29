import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoseController extends GetxController {
  final currentPose = 'Poza nije prepoznata'.obs;
  ValueNotifier<bool> playAnimation = ValueNotifier<bool>(false);
  int poseHoldingCounter = 0;
  bool onboardingCompleted = false;

  Color leftArmPaint = Colors.red;
  Color rightArmPaint = Colors.red;
  Color leftLegPaint = Colors.red;
  Color rightLegPaint = Colors.red;

  updateCurrentPose(String pose) {
    currentPose(pose);
  }

  updateLottieStatus(bool status){
    playAnimation.value = status;
  }

  setonboardingCompleted(bool value){
    onboardingCompleted = value;
  }
}
