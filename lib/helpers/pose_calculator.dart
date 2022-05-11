import 'dart:developer';
import 'package:get/get.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:vector_math/vector_math.dart' as vector_math;
import 'dart:math' as math;

import '../models/pose_model.dart';

class PoseCalculationHelper {
  late PoseController poseController;
  PoseModel poses = PoseModel.empty();

  PoseCalculationHelper() {
    poseController = Get.find<PoseController>();
  }

  void processBasePoses(List<Pose> poses) {
    this.poses = PoseModel(poses);

    poseController.poseCalculationDict.forEach((BasePose pose, double poseCounter) {
      var isPoseFunction = basePoseFunctions[pose];
      var isPose = isPoseFunction!(this.poses);

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
    log("DEBUG DictFAFA ${poseController.poseCalculationDict}");
  }

  void setNewPose() {
    var rnd = math.Random();
    var nextPose = BasePose.values[rnd.nextInt(BasePose.values.length)];
    while (nextPose.toStr.contains("LEG")) {
      nextPose = BasePose.values[rnd.nextInt(BasePose.values.length)];
    }
    poseController.wantedPose = nextPose;

    poseController.poseCalculationDict.forEach((key, value) {
      value = 0;
    });

    log("DEBUG Dict ${poseController.poseCalculationDict}");
  }

  void onboardingTabletPoseDetection(List<Pose> poses) {
    var landmarks = PoseModel(poses);

    double angleLeftShoulder = calculateAngle(landmarks.leftElbow, landmarks.leftShoulder, landmarks.leftHip);
    log("angleLeftShoulder = $angleLeftShoulder");
    if (angleLeftShoulder < 70 || angleLeftShoulder > 110) {
      log("tu vracam");
      return;
    }

    double angleRightShoulder = calculateAngle(landmarks.rightElbow, landmarks.rightShoulder, landmarks.rightHip);
    log("angleRightShoulder = $angleRightShoulder");
    if (angleRightShoulder < 70 || angleRightShoulder > 110) {
      log("tu vracam2");
      return;
    }

    double angleLeftElbow = calculateAngle(landmarks.leftWrist, landmarks.leftElbow, landmarks.leftShoulder);
    log("angleLeftElbow = $angleLeftElbow");
    if (angleRightShoulder < 160 || angleRightShoulder > 200) {
      log("tu vracam3");
      return;
    }

    double angleRightElbow = calculateAngle(landmarks.rightWrist, landmarks.rightElbow, landmarks.rightShoulder);
    log("angleRightElbow = $angleRightElbow");
    if (angleRightShoulder < 160 || angleRightShoulder > 200) {
      log("tu vracam4");
      return;
    }

    poseController.poseHoldingCounter++;
  }

  void onboardingPhonePoseDetection(List<Pose> poses) {
    var landmarks = PoseModel(poses);

    double angleLeftShoulder = calculateAngle(landmarks.leftElbow, landmarks.leftShoulder, landmarks.leftHip);
    log("angleLeftShoulder = $angleLeftShoulder");
    if (angleLeftShoulder < 65 || angleLeftShoulder > 115) {
      log("tu vracam1");
      return;
    }

    double angleRightShoulder = calculateAngle(landmarks.rightElbow, landmarks.rightShoulder, landmarks.rightHip);
    log("angleRightShoulder = $angleRightShoulder");
    if (angleRightShoulder < 65 || angleRightShoulder > 115) {
      log("tu vracam2");
      return;
    }

    double angleLeftElbow = calculateAngle(landmarks.leftWrist, landmarks.leftElbow, landmarks.leftShoulder);
    log("angleLeftElbow = $angleLeftElbow");
    if (angleRightShoulder < 70 || angleRightShoulder > 110) {
      log("tu vracam3");
      return;
    }

    double angleRightElbow = calculateAngle(landmarks.rightWrist, landmarks.rightElbow, landmarks.rightShoulder);
    log("angleRightElbow = $angleRightElbow");
    if (angleRightShoulder < 70 || angleRightShoulder > 110) {
      log("tu vracam4");
      return;
    }
    log("PROSLO");
    poseController.poseHoldingCounter++;
  }

  var basePoseFunctions = {
    BasePose.leftArmNeutral: isLeftArmNeutral,
    BasePose.leftArmMiddle: isLeftArmMiddle,
    BasePose.leftArmUp: isLeftArmUp,
    BasePose.rightArmNeutral: isRightArmNeutral,
    BasePose.rightArmMiddle: isRightArmMiddle,
    BasePose.rightArmUp: isRightArmUp,
    BasePose.leftLegNeutral: isLeftLegNeutral,
    BasePose.leftLegGap: isLeftLegGap,
    BasePose.leftLegUp: isLeftLegUp,
    BasePose.rightLegNeutral: isRightLegNeutral,
    BasePose.rightLegGap: isRightLegGap,
    BasePose.rightLegUp: isRightLegUp,
  };
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
  log("DEBUG isLeftArmNeutral: $r");
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
  log("DEBUG isLeftArmMiddle: $r");

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
  log("DEBUG isLeftArmUp: $r");

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
  log("DEBUG isRightArmNeutral: $r");

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
  log("DEBUG isRightArmMiddle: $r");

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
  log("DEBUG isRightArmUp: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isLeftLegNeutral(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isLeftLegNeutral: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isLeftLegGap(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isLeftLegGap: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isLeftLegUp(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isLeftLegUp: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isRightLegNeutral(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isRightLegNeutral: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isRightLegGap(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isRightLegGap: $r");

  if (r > 110) {
    return true;
  }
  return false;
}

bool isRightLegUp(PoseModel poses) {
  var p1 = poses.leftElbow;
  var p2 = poses.leftShoulder;
  var p3 = poses.leftHip;

  double r = calculateAngle(p1, p2, p3);
  log("DEBUG isRightLegUp: $r");

  if (r > 110) {
    return true;
  }
  return false;
}
