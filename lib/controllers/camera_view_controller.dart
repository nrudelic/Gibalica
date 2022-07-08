import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';

class CameraViewController extends GetxController {
  bool isPoseImageShowing = false;
  bool isOnboardingImageShowing = false;
  bool isProgressBarShowing = false;
  bool isOnboardingCompletedAnimationShowing = false;
  bool isPoseSuccessfullAnimationShowing = false;
  Timer? poseTimer;
  Timer? onboardingTimer;
  Timer? onboardingInnerTimer;
  Timer? poseInnerTimer;
  bool cameraOn = false;

  PausableTimer? repetitionTimer;

  void startRepetitionTimer(var repetitionTime) {
    log("START TIMER");
    repetitionTimer = PausableTimer(
      Duration(seconds: repetitionTime),
      () {
        var gameController = Get.find<GameController>();
        gameController.isCurrentGameFinished = true;
        isProgressBarShowing = false;
        isPoseImageShowing = false;
        isOnboardingImageShowing = false;
        poseTimer!.cancel();
        poseTimer!.cancel();
        onboardingTimer!.cancel();
        onboardingInnerTimer!.cancel();
        poseInnerTimer!.cancel();
      },
    );
    repetitionTimer!.start();
    log("IS TIMER NULL" + (repetitionTimer == null).toString());
  }

  void pauseRepetitionTimer() {
    repetitionTimer!.pause();
  }

  void resumeRepetitionTimer() {
    repetitionTimer!.start();
  }

  void startCameraTimer() {
    if (!cameraOn) return;

    poseTimer = Timer(const Duration(seconds: 10), () {
      isPoseImageShowing = true;
      poseInnerTimer = Timer(const Duration(seconds: 4), () {
        isPoseImageShowing = false;
      });
    });
  }

  void startCameraOnboardingTimer() {
    if (!cameraOn) return;
    onboardingTimer = Timer(const Duration(seconds: 10), () {
      isOnboardingImageShowing = true;

      onboardingInnerTimer = Timer(const Duration(seconds: 4), () {
        isOnboardingImageShowing = false;
      });
    });
  }

  void cancelTimer() {
    poseTimer?.cancel();
    poseTimer = null;
  }

  void cancelOnboardingTimer() {
    onboardingTimer?.cancel();
    onboardingTimer = null;
  }

  void cancelInnerTimers() {
    onboardingInnerTimer?.cancel();
    onboardingInnerTimer = null;
    poseInnerTimer?.cancel();
  }

  int maxX = 720;
  int maxY = 1280;
}
