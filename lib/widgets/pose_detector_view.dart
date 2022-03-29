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

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 2), (Timer t) => handleCurrentPose());
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

    if (widget.poseController.onboardingCompleted) {
      poseCalculationHelper.processPoses(poses);
    } else {
      if (true) {
        poseCalculationHelper.onboardingPhonePoseDetection(poses);
      } else {
        poseCalculationHelper.onboardingTabletPoseDetection(poses);
      }
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

  handleCurrentPose() {
    log("TRENUTNO IMAM: ${widget.poseController.poseHoldingCounter}");
    if (widget.poseController.poseHoldingCounter > 20) {
      widget.poseController.updateLottieStatus(true);
      widget.poseController.setonboardingCompleted(true);
      log("ONBOARDING COMPLETED!");
    }
    widget.poseController.poseHoldingCounter = 0;
  }
}
