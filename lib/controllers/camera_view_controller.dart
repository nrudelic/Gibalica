import 'dart:async';
import 'package:get/get.dart';

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

  void startCameraTimer() {
    print("TIMER" + cameraOn.toString());
    if (!cameraOn) return;
      print("TIMER AGAIEBGOA STARTED");

    poseTimer = Timer(const Duration(seconds: 10), (){
      isPoseImageShowing = true;
      poseInnerTimer = Timer(const Duration(seconds: 3), () {
        print("TIMER AGAIEBGOA");

        isPoseImageShowing = false;
      });
    });
  }

  void startCameraOnboardingTimer() {
    if (!cameraOn) return;
    print("TIMER AHUESE STARTED" );

    onboardingTimer = Timer(const Duration(seconds: 10), ()  {
      isOnboardingImageShowing = true;

      onboardingInnerTimer = Timer(const Duration(seconds: 3), () {
        print("TIMER AHUESE");
        isOnboardingImageShowing = false;
      });
    });
  }

  void cancelTimer() {
    poseTimer?.cancel();
    poseTimer = null;
    print("TIMER CANCELED");
  }

  void cancelOnboardingTimer() {
    onboardingTimer?.cancel();
    onboardingTimer = null;
    print("TIMER CANCELED");
  }

  void cancelInnerTimers() {
    onboardingInnerTimer?.cancel();
    onboardingInnerTimer = null;
    poseInnerTimer?.cancel();
  }

  int maxX = 720;
  int maxY = 1280;
}
