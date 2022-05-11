import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/device_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/helpers/pose_calculator.dart';
import 'package:gibalica/widgets/camera_view.dart';
import 'package:gibalica/widgets/pose_painter.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class PoseDetectorView extends StatefulWidget {
  final poseController = Get.find<PoseController>();
  final deviceController = Get.find<DeviceController>();

  PoseDetectorView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  PoseCalculationHelper poseCalculationHelper = PoseCalculationHelper();
  bool isBusy = false;
  CustomPaint? customPaint;
  DateTime? timestamp;

  @override
  void initState() {
    super.initState();
    widget.poseController.onboardingCompleted = false;
    poseCalculationHelper.setNewPose();
  }

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
    // if (widget.poseController.onboardingCompleted) {
    poseCalculationHelper.processBasePoses(poses);
    isPoseSuccessful();
    // } else {
    //   if (true) {
    //     poseCalculationHelper.onboardingPhonePoseDetection(poses);
    //   } else {
    //     poseCalculationHelper.onboardingTabletPoseDetection(poses);
    //   }
    // }

    if (inputImage.inputImageData?.size != null && inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size, inputImage.inputImageData!.imageRotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }

    if (timestamp == null) {
      timestamp = DateTime.now();
    } else {
      Duration diff = DateTime.now().difference(timestamp!);
      timestamp = DateTime.now();
      widget.poseController.frameDelta = diff.inMilliseconds / 1000;
      log("DELTA: ${diff.inMilliseconds / 1000}");
    }
  }

  void isPoseSuccessful() {
    if (widget.poseController.poseCalculationDict[widget.poseController.wantedPose] == 3) {
      poseCalculationHelper.setNewPose();
      widget.poseController.updateLottieStatus(true);
    }
  }
}
