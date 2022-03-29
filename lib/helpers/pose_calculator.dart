import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:vector_math/vector_math.dart' as vector_math;
import 'dart:math' as math;

import '../models/pose_model.dart';

class PoseCalculationHelper {
  late PoseController poseController;

  PoseCalculationHelper() {
    poseController = Get.find<PoseController>();
  }

  bool checkElbowRight(List<Pose> poses) {
    PoseLandmark? p1;
    PoseLandmark? p2;
    PoseLandmark? p3;

    for (var pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        if (_.toString() == 'PoseLandmarkType.rightShoulder') {
          p1 = landmark;
        }
        if (_.toString() == 'PoseLandmarkType.rightElbow') {
          p2 = landmark;
        }
        if (_.toString() == 'PoseLandmarkType.rightWrist') {
          p3 = landmark;
        }
      });
    }
    double r = calculateAngle(p1, p2, p3);
    if (r > 80 && r < 100) {
      return true;
    } else {
      return false;
    }
  }

  bool checkElbowLeft(List<Pose> poses) {
    PoseLandmark? p1;
    PoseLandmark? p2;
    PoseLandmark? p3;

    for (var pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        if (_.toString() == 'PoseLandmarkType.leftShoulder') {
          p1 = landmark;
        }
        if (_.toString() == 'PoseLandmarkType.leftElbow') {
          p2 = landmark;
        }
        if (_.toString() == 'PoseLandmarkType.leftWrist') {
          p3 = landmark;
        }
      });
    }
    double r = calculateAngle(p1, p2, p3);
    if (r > 80 && r < 100) {
      return true;
    } else {
      return false;
    }
  }

  double calculateAngle(PoseLandmark? p1, PoseLandmark? p2, PoseLandmark? p3) {
    if (p1 == null || p2 == null || p3 == null) return 0;

    double r = vector_math.degrees(math.atan2(p3.y - p2.y, p3.x - p2.x) -
        math.atan2(p1.y - p2.y, p1.x - p2.x));
    r = r.abs();
    if (r > 180) {
      r = 360.0 - r;
    }
    return r;
    // if (r > 80 && r < 100) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  void processPoses(List<Pose> poses) {
    bool isRightElbow = checkElbowRight(poses);
    bool isLeftElbow = checkElbowLeft(poses);

    if (isRightElbow || isLeftElbow) {
      poseController.poseHoldingCounter++;

      if (isRightElbow) {
        poseController.updateCurrentPose('Desni lakat 90 stupnjeva');
        poseController.rightArmPaint = Colors.green;
      }
      if (isLeftElbow) {
        poseController.updateCurrentPose('Lijevi lakat 90 stupnjeva');
        poseController.leftArmPaint = Colors.green;
      }
    } else {
      poseController.leftArmPaint = Colors.red;
      poseController.rightArmPaint = Colors.red;
      poseController.updateCurrentPose('Poza nije prepoznata');
    }
  }

  void onboardingTabletPoseDetection(List<Pose> poses) {
    var landmarks = PoseModel(poses);

    double angleLeftShoulder = calculateAngle(landmarks.leftElbow, landmarks.leftShoulder, landmarks.leftHip);
    log("angleLeftShoulder = $angleLeftShoulder");
    if(angleLeftShoulder < 70 || angleLeftShoulder > 110){
      log("tu vracam");      return;
    }

    double angleRightShoulder = calculateAngle(landmarks.rightElbow, landmarks.rightShoulder, landmarks.rightHip);
    log("angleRightShoulder = $angleRightShoulder");
    if(angleRightShoulder < 70 || angleRightShoulder > 110){
      log("tu vracam2");
      return;
    }

    double angleLeftElbow = calculateAngle(landmarks.leftWrist, landmarks.leftElbow, landmarks.leftShoulder);
    log("angleLeftElbow = $angleLeftElbow");
    if(angleRightShoulder < 160 || angleRightShoulder > 200){
      log("tu vracam3");
      return;
    }

    double angleRightElbow = calculateAngle(landmarks.rightWrist, landmarks.rightElbow, landmarks.rightShoulder);
    log("angleRightElbow = $angleRightElbow");
    if(angleRightShoulder < 160 || angleRightShoulder > 200){
      log("tu vracam4");
      return;
    }
    
    poseController.poseHoldingCounter++;
  }

  void onboardingPhonePoseDetection(List<Pose> poses) {
    var landmarks = PoseModel(poses);
    
    double angleLeftShoulder = calculateAngle(landmarks.leftElbow, landmarks.leftShoulder, landmarks.leftHip);
    log("angleLeftShoulder = $angleLeftShoulder");
    if(angleLeftShoulder < 70 || angleLeftShoulder > 110){
      return;
    }

    double angleRightShoulder = calculateAngle(landmarks.rightElbow, landmarks.rightShoulder, landmarks.rightHip);
    log("angleRightShoulder = $angleRightShoulder");
    if(angleRightShoulder < 70 || angleRightShoulder > 110){
      return;
    }

    double angleLeftElbow = calculateAngle(landmarks.leftWrist, landmarks.leftElbow, landmarks.leftShoulder);
    log("angleLeftElbow = $angleLeftElbow");
    if(angleRightShoulder < 80 || angleRightShoulder > 100){
      return;
    }

    double angleRightElbow = calculateAngle(landmarks.rightWrist, landmarks.rightElbow, landmarks.rightShoulder);
    log("angleRightElbow = $angleRightElbow");
    if(angleRightShoulder < 80 || angleRightShoulder > 100){
      return;
    }
    
    poseController.poseHoldingCounter++;
  }
}
