import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/PoseController.dart';
import 'package:gibalica/camera_view.dart';
import 'package:gibalica/pose_painter.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:vector_math/vector_math.dart';
import 'dart:core';
import 'dart:math' as math;

class PoseDetectorView extends StatefulWidget {
  final poseController = Get.find<PoseController>();

  PoseDetectorView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Pose Detector',
      customPaint: customPaint,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(inputImage);

    // poses.forEach((pose) {
    //   pose.landmarks.forEach((_, landmark) {
    //     print('PoselandmarkType: ${_}, landmarkType: ${landmark.type}, x: ${landmark.x}, y: ${landmark.y}, z: ${landmark.z}');
    //   });
    // });
    bool isRightElbow = checkElbowRight(poses);
    bool isLeftElbow = checkElbowLeft(poses);

    if (isRightElbow || isLeftElbow) {
      if (isRightElbow) {
        widget.poseController.updateCurrentPose('Desni lakat 90 stupnjeva');
        // setState(() {
        //   widget.pose = "Desni lakat 90 stupnjeva";
        // });
      } else {
        widget.poseController.updateCurrentPose('Lijevi lakat 90 stupnjeva');

        // setState(() {
        //   widget.pose = "Lijevi lakat 90 stupnjeva";
        // });
      }
    } else {
      widget.poseController.updateCurrentPose('Poza nije prepoznata');

      // setState(() {
      //   widget.pose = "Poza nije prepoznata";
      // });
    }

    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
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

    if (p1 == null || p2 == null || p3 == null) return false;

    double r = degrees(math.atan2(p3!.y - p2!.y, p3!.x - p2!.x) -
        math.atan2(p1!.y - p2!.y, p1!.x - p2!.x));

    r = r.abs(); // Angle should never be negative
    if (r > 180) {
      r = 360.0 - r; // Always get the acute representation of the angle
    }

    if (r > 80 && r < 100) {
      return true;
      // log("Timestmap: ${DateTime.now()}, Kut: $r");
      // setState(() {
      //   widget.pose = "Desni lakat 90 stupnjeva";
      // });
    } else {
      return false;
      // setState(() {
      //   widget.pose = "Poza nije prepoznata";
      // });
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

    if (p1 == null || p2 == null || p3 == null) return false;

    double r = degrees(math.atan2(p3!.y - p2!.y, p3!.x - p2!.x) -
        math.atan2(p1!.y - p2!.y, p1!.x - p2!.x));

    r = r.abs(); // Angle should never be negative
    if (r > 180) {
      r = 360.0 - r; // Always get the acute representation of the angle
    }

    if (r > 80 && r < 100) {
      return true;
      // log("Timestmap: ${DateTime.now()}, Kut: $r");
      // setState(() {
      //   widget.pose = "Lijevi lakat 90 stupnjeva";
      // });
    } else {
      return false;
    //   setState(() {
    //     widget.pose = "Poza nije prepoznata";
    //   });
    }
  }
}
