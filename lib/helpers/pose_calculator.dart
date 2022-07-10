import 'dart:developer';
import 'package:get/get.dart';
import 'package:gibalica/controllers/camera_view_controller.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/main.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:vector_math/vector_math.dart' as vector_math;
import 'dart:math' as math;

import '../models/pose_model.dart';

class PoseCalculationHelper {
  late PoseController poseController;
  late GameController gameController;
  late CameraViewController cameraController;
  PoseModel poses = PoseModel.empty();

  PoseCalculationHelper() {
    poseController = Get.find<PoseController>();
    gameController = Get.find<GameController>();
    cameraController = Get.find<CameraViewController>();
  }

  void processBasePoses(List<Pose> poses, bool isOnboarding) {
    
    this.poses = PoseModel(poses);

    if (!poseController.onboardingCompleted) {
      if (this.poses.leftShoulder != null) {
        poseController.yLeftShoulder = this.poses.leftShoulder!.y;
      }
      if (this.poses.rightShoulder != null) {
        poseController.yRightShoulder = this.poses.rightShoulder!.y;
      }
    }

    if (gameController.gameMode == GameMode.training || gameController.gameMode == GameMode.repeating || !poseController.onboardingCompleted) {
      Map<BasePose, double> posesDict = {};
      posesDict = poseController.poseCalculationDict;

      var basePoseFunctions = basePoseFunctionsPersonal;
      if(gameController.gameType.value == GameType.cards){
        basePoseFunctions = basePoseFunctionsCards;
      }

      posesDict.forEach((BasePose pose, double poseCounter) {
        var isPoseFunction = basePoseFunctions[pose];

        // Check if pose taking is succesfull for this frame
        var isPose = isPoseFunction!(this.poses);

        // If pose is succesfully taken then we have to increase pose counter in dictionary
        if (isPose) {
          if (poseCounter + poseController.frameDelta > 3) {
            poseController.poseCalculationDict[pose] = 3;
          } else {
            poseController.poseCalculationDict[pose] = poseCounter + poseController.frameDelta;
          }
        } else {
          if (poseCounter - poseController.frameDelta * 0.5 < 0) {
            poseController.poseCalculationDict[pose] = 0;
          } else {
            poseController.poseCalculationDict[pose] = poseCounter - poseController.frameDelta * 0.5;
          }
        }
      });
    } else if (gameController.gameMode == GameMode.dayAndNight) {
      Map<DayNightEnum, double> dayNightDict = {};
      dayNightDict = poseController.dayNightDict;

      dayNightDict.forEach((DayNightEnum pose, double poseCounter) {
        var isPoseFunction = dayNightFunctions[pose];

        // Check if pose taking is succesfull for this frame
        var isPose = isPoseFunction!(this.poses, cameraController);

        // If pose is succesfully taken then we have to increase pose counter in dictionary
        if (isPose) {
          if (poseCounter + poseController.frameDelta > 3) {
            poseController.dayNightDict[pose] = 3;
          } else {
            poseController.dayNightDict[pose] = poseCounter + poseController.frameDelta;
          }
        } else {
          if (poseCounter - poseController.frameDelta * 0.5 < 0) {
            poseController.dayNightDict[pose] = 0;
          } else {
            poseController.dayNightDict[pose] = poseCounter - poseController.frameDelta * 0.5;
          }
        }
      });
    }
  }

  void setNewRepeatingGameModePose() {
    var rnd = math.Random();
    var nextPose = BasePose.values[rnd.nextInt(BasePose.values.length)];

    poseController.wantedPose = nextPose;

    poseController.poseCalculationDict.forEach((key, value) {
      value = 0;
    });
  }

  void setNewTrainingGameModePose() {
    var rnd = math.Random();
    var possiblePoses = gameController.possiblePoses;
    log("DEEBUG" + possiblePoses.toString());
    if (possiblePoses != null) {
      var nextPose = possiblePoses[rnd.nextInt(possiblePoses.length)];
      log("DEEBUG1" + nextPose.toStr);

      poseController.wantedPose = nextPose;

      poseController.poseCalculationDict.forEach((key, value) {
        value = 0;
      });
    }
  }

  void setNewRepeatinGameModePose() {
    var rnd = math.Random();

    var possiblePoses = [];

    if (playerController.leftLegPref.value) {
      possiblePoses.addAll([BasePose.leftArmMiddle, BasePose.leftArmUp]);
    }
    if (playerController.rightHandPref.value) {
      possiblePoses.addAll([BasePose.rightArmMiddle, BasePose.rightArmUp]);
    }
    if (playerController.rightHandPref.value && playerController.leftHandPref.value) {
      possiblePoses.addAll([BasePose.leftArmUpRightArmMiddle, BasePose.leftArmUpRightArmUp, BasePose.leftArmMiddleRightArmUp, BasePose.leftArmMiddleRightArmMiddle]);
    }
    if (playerController.leftLegPref.value) {
      possiblePoses.addAll([BasePose.leftLegUp]);
    }
    if (playerController.rightLegPref.value) {
      possiblePoses.addAll([BasePose.rightLegUp]);
    }
    if (playerController.rightLegPref.value && playerController.leftLegPref.value) {
      possiblePoses.addAll([BasePose.gap]);
    }
    if (playerController.squatPref.value) {
      possiblePoses.addAll([BasePose.squat]);
    }
    var nextPose = possiblePoses[rnd.nextInt(possiblePoses.length)];

    poseController.wantedPose = nextPose;

    poseController.poseCalculationDict.forEach((key, value) {
      value = 0;
    });
  }

  void setNewDayNightPosition() {
    var rnd = math.Random();
    var nextPose = DayNightEnum.values[rnd.nextInt(DayNightEnum.values.length)];

    poseController.wantedDayNightPosition = nextPose;

    poseController.dayNightDict.forEach((key, value) {
      value = 0;
    });
  }

  var basePoseFunctionsPersonal = {
    BasePose.leftArmNeutral: isLeftArmNeutral,
    BasePose.leftArmMiddle: isLeftArmMiddle,
    BasePose.leftArmUp: isLeftArmUp,
    BasePose.rightArmNeutral: isRightArmNeutral,
    BasePose.rightArmMiddle: isRightArmMiddle,
    BasePose.rightArmUp: isRightArmUp,
    BasePose.leftLegNeutral: isLeftLegNeutral,
    BasePose.leftLegUp: isLeftLegUp,
    BasePose.rightLegNeutral: isRightLegNeutral,
    BasePose.rightLegUp: isRightLegUp,
    BasePose.gap: isGap,
    BasePose.leftArmUpRightArmMiddle: isLeftArmUpRightArmMiddle,
    BasePose.leftArmUpRightArmUp: isLeftArmUpRightArmUp,
    BasePose.leftArmMiddleRightArmUp: isLeftArmMiddleRightArmUp,
    BasePose.leftArmMiddleRightArmMiddle: isLeftArmMiddleRightArmMiddle,
    BasePose.squat: isSquat,
  };

  var basePoseFunctionsCards = {
    BasePose.leftArmNeutral: isRightArmNeutral,
    BasePose.leftArmMiddle: isRightArmMiddle,
    BasePose.leftArmUp: isRightArmUp,
    BasePose.rightArmNeutral: isLeftArmNeutral,
    BasePose.rightArmMiddle: isLeftArmMiddle,
    BasePose.rightArmUp: isLeftArmUp,
    BasePose.leftLegNeutral: isRightLegNeutral,
    BasePose.leftLegUp: isRightLegUp,
    BasePose.rightLegNeutral: isLeftLegNeutral,
    BasePose.rightLegUp: isLeftLegUp,
    BasePose.gap: isGap,
    BasePose.leftArmUpRightArmMiddle: isLeftArmMiddleRightArmUp,
    BasePose.leftArmUpRightArmUp: isLeftArmUpRightArmUp,
    BasePose.leftArmMiddleRightArmUp: isLeftArmUpRightArmMiddle,
    BasePose.leftArmMiddleRightArmMiddle: isLeftArmMiddleRightArmMiddle,
    BasePose.squat: isSquat,
  };

  var dayNightFunctions = {
    DayNightEnum.day: isDay,
    DayNightEnum.night: isNight,
  };
}

bool isDay(PoseModel poses, CameraViewController cameraController) {
  var rightShoulder = poses.rightShoulder;
  if (rightShoulder != null && rightShoulder.y < (cameraController.maxY / 1.67)) return true;

  return false;
}

bool isNight(PoseModel poses, CameraViewController cameraController) {
  var rightShoulder = poses.rightShoulder;
  if (rightShoulder != null && rightShoulder.y > (cameraController.maxY / 1.67)) return true;

  return false;
}

double calculateAngle(PoseLandmark? p1, PoseLandmark? p2, PoseLandmark? p3) {
  if (p1 == null || p2 == null || p3 == null) return 0;

  double r = vector_math.degrees(math.atan2(p3.y - p2.y, p3.x - p2.x) - math.atan2(p1.y - p2.y, p1.x - p2.x));

  r = r.abs();
  if (r > 180) {
    r = 360.0 - r;
  }
  return r;
}

bool isLeftArmNeutral(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  if (r > 0 && r < 30) {
    return true;
  }
  return false;
}

bool isLeftArmMiddle(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 80 && r < 100 && isRightArmNeutral(poses)) {
    return true;
  }
  return false;
}

bool isLeftArmMiddleWithoutNeutral(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 80 && r < 100) {
    return true;
  }
  return false;
}

bool isLeftArmUp(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 110 && isRightArmNeutral(poses)) {
    return true;
  }
  return false;
}

bool isLeftArmUpWithoutNeutral(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 110) {
    return true;
  }
  return false;
}

bool isRightArmNeutral(PoseModel poses) {
  var p1 = poses.rightElbow;
  var p2 = poses.rightShoulder;
  var p3 = poses.rightHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 0 && r < 30) {
    return true;
  }
  return false;
}

bool isRightArmMiddle(PoseModel poses) {
  var p1 = poses.rightElbow;
  var p2 = poses.rightShoulder;
  var p3 = poses.rightHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 80 && r < 100 && isLeftArmNeutral(poses)) {
    return true;
  }
  return false;
}

bool isRightArmMiddleWithoutNeutral(PoseModel poses) {
  var p1 = poses.rightElbow;
  var p2 = poses.rightShoulder;
  var p3 = poses.rightHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 80 && r < 100) {
    return true;
  }
  return false;
}

bool isRightArmUp(PoseModel poses) {
  var p1 = poses.rightElbow;
  var p2 = poses.rightShoulder;
  var p3 = poses.rightHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 110 && isLeftArmNeutral(poses)) {
    return true;
  }
  return false;
}

bool isRightArmUpWithoutNeutral(PoseModel poses) {
  var p1 = poses.rightElbow;
  var p2 = poses.rightShoulder;
  var p3 = poses.rightHip;

  double r = calculateAngle(p1, p2, p3);

  if (r > 110) {
    return true;
  }
  return false;
}

bool isLeftLegNeutral(PoseModel poses) {
  var p1 = poses.leftShoulder;
  var p2 = poses.leftHip;
  var p3 = poses.leftKnee;

  double r = calculateAngle(p1, p2, p3);
  if (r > 160 && r < 200) {
    return true;
  }
  return false;
}

bool isLeftLegUp(PoseModel poses) {
  var rightHip = poses.rightHip;
  var leftKnee = poses.leftKnee;
  var rightKnee = poses.rightKnee;

  if (rightHip != null && leftKnee != null && rightKnee != null) {
    var delta = (rightKnee.y - rightHip.y) / 7;
    if (leftKnee.y <= rightKnee.y - delta) {
      return true;
    }
  }
  return false;
}

bool isRightLegNeutral(PoseModel poses) {
  var p1 = poses.rightShoulder;
  var p2 = poses.rightHip;
  var p3 = poses.rightKnee;

  double r = calculateAngle(p1, p2, p3);
  if (r > 160 && r < 200) {
    return true;
  }
  return false;
}

bool isRightLegUp(PoseModel poses) {
  var leftHip = poses.leftHip;
  var rightKnee = poses.rightKnee;
  var leftKnee = poses.leftKnee;

  if (leftHip != null && rightKnee != null && leftKnee != null) {
    var delta = (leftKnee.y - leftHip.y) / 7;
    if (rightKnee.y <= leftKnee.y - delta) {
      return true;
    }
  }
  return false;
}

bool isGap(PoseModel poses) {
  var p11 = poses.leftShoulder;
  var p21 = poses.leftHip;
  var p31 = poses.leftKnee;

  double r1 = calculateAngle(p11, p21, p31);

  var p12 = poses.rightShoulder;
  var p22 = poses.rightHip;
  var p32 = poses.rightKnee;

  double r2 = calculateAngle(p12, p22, p32);

  if (r1 < 168 && r2 < 168) {
    return true;
  }

  return false;
}

bool isLeftArmUpRightArmMiddle(PoseModel poses) {
  if (isLeftArmUpWithoutNeutral(poses) && isRightArmMiddleWithoutNeutral(poses)) {
    return true;
  }
  return false;
}

bool isLeftArmUpRightArmUp(PoseModel poses) {
  if (isLeftArmUpWithoutNeutral(poses) && isRightArmUpWithoutNeutral(poses)) {
    return true;
  }
  return false;
}

bool isLeftArmMiddleRightArmUp(PoseModel poses) {
  if (isLeftArmMiddleWithoutNeutral(poses) && isRightArmUpWithoutNeutral(poses)) {
    return true;
  }
  return false;
}

bool isLeftArmMiddleRightArmMiddle(PoseModel poses) {
  if (isLeftArmMiddleWithoutNeutral(poses) && isRightArmMiddleWithoutNeutral(poses)) {
    return true;
  }
  return false;
}

bool isSquat(PoseModel poses) {
  var cameraController = Get.find<CameraViewController>();
  var rightShoulder = poses.rightShoulder;
  if (rightShoulder != null && rightShoulder.y > (cameraController.maxY / 1.67)) return true;
  return false;
}
