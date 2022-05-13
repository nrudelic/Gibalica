import 'dart:async';
import 'package:get/get.dart';

class CameraViewController extends GetxController {
  bool isPoseImageShowing = false;
  bool isOnboardingImageShowing = false;
  bool isProgressBarShowing = false;
  bool isOnboardingCompletedAnimationShowing = false;
  bool isPoseSuccessfullAnimationShowing = false;
  Timer? timer;

  void startCameraTimer() {
    timer = Timer(const Duration(seconds: 7), () {
      isPoseImageShowing = true;
      Timer(const Duration(seconds: 3), () {
        isPoseImageShowing = false;
      });
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }
}
