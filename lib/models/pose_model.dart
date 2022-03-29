import 'package:google_ml_kit/google_ml_kit.dart';

class PoseModel {
  PoseLandmark? nose;
  PoseLandmark? leftEyeInner;
  PoseLandmark? leftEye;
  PoseLandmark? leftEyeOuter;
  PoseLandmark? rightEyeInner;
  PoseLandmark? rightEye;
  PoseLandmark? rightEyeOuter;
  PoseLandmark? leftEar;
  PoseLandmark? rightEar;
  PoseLandmark? leftMouth;
  PoseLandmark? rightMouth;
  PoseLandmark? leftShoulder;
  PoseLandmark? rightShoulder;
  PoseLandmark? leftElbow;
  PoseLandmark? rightElbow;
  PoseLandmark? leftWrist;
  PoseLandmark? rightWrist;
  PoseLandmark? leftPinky;
  PoseLandmark? rightPinky;
  PoseLandmark? leftIndex;
  PoseLandmark? rightIndex;
  PoseLandmark? leftThumb;
  PoseLandmark? rightThumb;
  PoseLandmark? leftHip;
  PoseLandmark? rightHip;
  PoseLandmark? leftKnee;
  PoseLandmark? rightKnee;
  PoseLandmark? leftAnkle;
  PoseLandmark? rightAnkle;
  PoseLandmark? leftHeel;
  PoseLandmark? rightHeel;
  PoseLandmark? leftFootIndex;
  PoseLandmark? rightFootIndex;

  PoseModel(List<Pose> poses) {
    for (var pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        switch (_) {
          case PoseLandmarkType.nose:
            nose = landmark;
            break;
          case PoseLandmarkType.leftEyeInner:
            leftEyeInner = landmark;
            break;
          case PoseLandmarkType.leftEye:
            leftEye = landmark;
            break;
          case PoseLandmarkType.leftEyeOuter:
            leftEyeOuter = landmark;
            break;
          case PoseLandmarkType.rightEyeInner:
            rightEyeInner = landmark;
            break;
          case PoseLandmarkType.rightEye:
            rightEye = landmark;
            break;
          case PoseLandmarkType.rightEyeOuter:
            rightEyeOuter = landmark;
            break;
          case PoseLandmarkType.leftEar:
            leftEar = landmark;
            break;
          case PoseLandmarkType.rightEar:
            rightEar = landmark;
            break;
          case PoseLandmarkType.leftMouth:
            leftMouth = landmark;
            break;
          case PoseLandmarkType.rightMouth:
            rightMouth = landmark;
            break;
          case PoseLandmarkType.leftShoulder:
            leftShoulder = landmark;
            break;
          case PoseLandmarkType.rightShoulder:
            rightShoulder = landmark;
            break;
          case PoseLandmarkType.leftElbow:
            leftElbow = landmark;
            break;
          case PoseLandmarkType.rightElbow:
            rightElbow = landmark;
            break;
          case PoseLandmarkType.leftWrist:
            leftWrist = landmark;
            break;
          case PoseLandmarkType.rightWrist:
            rightWrist = landmark;
            break;
          case PoseLandmarkType.leftPinky:
            leftPinky = landmark;
            break;
          case PoseLandmarkType.rightPinky:
            rightPinky = landmark;
            break;
          case PoseLandmarkType.leftIndex:
            leftIndex = landmark;
            break;
          case PoseLandmarkType.rightIndex:
            rightIndex = landmark;
            break;
          case PoseLandmarkType.leftThumb:
            leftThumb = landmark;
            break;
          case PoseLandmarkType.rightThumb:
            rightThumb = landmark;
            break;
          case PoseLandmarkType.leftHip:
            leftHip = landmark;
            break;
          case PoseLandmarkType.rightHip:
            rightHip = landmark;
            break;
          case PoseLandmarkType.leftKnee:
            leftKnee = landmark;
            break;
          case PoseLandmarkType.rightKnee:
            rightKnee = landmark;
            break;
          case PoseLandmarkType.leftAnkle:
            leftAnkle = landmark;
            break;
          case PoseLandmarkType.rightAnkle:
            rightAnkle = landmark;
            break;
          case PoseLandmarkType.leftHeel:
            leftHeel = landmark;
            break;
          case PoseLandmarkType.rightHeel:
            rightHeel = landmark;
            break;
          case PoseLandmarkType.leftFootIndex:
            leftFootIndex = landmark;
            break;
          case PoseLandmarkType.rightFootIndex:
            rightFootIndex = landmark;
            break;
        }
      });
    }
  }
}
