import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/camera_view_controller.dart';
import 'package:gibalica/controllers/device_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/helpers/pose_calculator.dart';
import 'package:gibalica/models/pose_model.dart';
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
  CameraViewController cameraViewController = Get.find<CameraViewController>();
  PoseCalculationHelper poseCalculationHelper = PoseCalculationHelper();
  bool isBusy = false;
  CustomPaint? customPaint;
  DateTime? timestamp;

  @override
  void initState() {
    super.initState();
    widget.poseController.onboardingCompleted = false;
    cameraViewController.isOnboardingImageShowing = true;
    //poseCalculationHelper.setNewPose();
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
    // poseCalculationHelper.processBasePoses(poses, true);
    // isOnboardingSuccessfull();
    if (!cameraViewController.isProgressBarShowing) {
      widget.poseController.poseCalculationDict.forEach((name, value) => widget.poseController.poseCalculationDict[name] = 0);
    }
    if (cameraViewController.isProgressBarShowing) {
      print("TIMER ZOVEM");
      poseCalculationHelper.processBasePoses(poses, true);
      print("TIMER ${widget.poseController.poseCalculationDict}");

      if (widget.poseController.onboardingCompleted) {
        isPoseSuccessful();
      } else {
        isOnboardingSuccessfull();
      }
    }

    // if (widget.poseController.onboardingCompleted) {
    //   poseCalculationHelper.processBasePoses(poses, false);
    //   isPoseSuccessful();
    // } else {
    //   if (true) {
    //     poseCalculationHelper.processBasePoses(poses, true);
    //     isOnboardingSuccessfull();

    //     //poseCalculationHelper.onboardingPhonePoseDetection(poses);
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
    print("tusam ${widget.poseController.poseCalculationDict}");
    if (widget.poseController.poseCalculationDict[widget.poseController.wantedPose]! > 1 && cameraViewController.timer != null && cameraViewController.timer!.isActive){
      cameraViewController.cancelTimer();
    }
    if (widget.poseController.poseCalculationDict[widget.poseController.wantedPose]! < 0.5 && (cameraViewController.timer == null || !cameraViewController.timer!.isActive)){
      cameraViewController.startCameraTimer();
    }
    if (widget.poseController.poseCalculationDict[widget.poseController.wantedPose] == 3) {
      print("TIMER succ");

      poseCalculationHelper.setNewPose();
      widget.poseController.updateLottieStatus(true);
      AudioCache player = new AudioCache();
      const alarmAudioPath = "bell.wav";
      player.play(alarmAudioPath);
      cameraViewController.isProgressBarShowing = false;
      widget.poseController.onboardingCompleted = false;
    }
  }

  void isOnboardingSuccessfull() {
    if (widget.poseController.poseCalculationDict[BasePose.leftArmNeutral] == 3 && widget.poseController.poseCalculationDict[BasePose.rightArmNeutral] == 3 && widget.poseController.poseCalculationDict[BasePose.leftLegNeutral] == 3 && widget.poseController.poseCalculationDict[BasePose.rightLegNeutral] == 3) {
      print("TIMER obsucc");

      widget.poseController.onboardingCompleted = true;
      widget.poseController.updateLottieStatus(true);
      AudioCache player = new AudioCache();
      const alarmAudioPath = "bell.wav";
      player.play(alarmAudioPath);
      cameraViewController.isProgressBarShowing = false;
    }
  }
}
