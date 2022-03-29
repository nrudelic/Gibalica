
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/pose_controller.dart';

class AnimationOverlay extends StatelessWidget {
  AnimationOverlay({
    Key? key,
    required this.lottieController,
  }) : super(key: key);

  final AnimationController lottieController;
  final poseController = Get.find<PoseController>();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> playAnimation = poseController.playAnimation;
    return ValueListenableBuilder<bool>(
      valueListenable: playAnimation,
      builder: (context, value, child) {
        if (value) {
          return LottieAnimation(
            lottieController: lottieController,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({
    Key? key,
    required this.lottieController,
  }) : super(key: key);
  final AnimationController lottieController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_bevi1628.json',
            repeat: true,
            controller: lottieController, onLoaded: (comp) {
          lottieController
            ..duration = comp.duration
            ..forward();
        }),
      ),
    );
  }
}
