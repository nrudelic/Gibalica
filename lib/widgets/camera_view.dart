// import 'dart:io';

import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/lottie_animation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../main.dart';
import '../controllers/camera_view_controller.dart';
import '../controllers/pose_controller.dart';
import '../helpers/pose_calculator.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  CameraView({Key? key, required this.title, required this.customPaint, required this.onImage, this.initialDirection = CameraLensDirection.front}) : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;
  final poseController = Get.find<PoseController>();

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  final poseController = Get.find<PoseController>();
  final gameController = Get.find<GameController>();
  CameraViewController cameraViewController = Get.find<CameraViewController>();

  CameraController? _controller;
  int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == widget.initialDirection) {
        _cameraIndex = i;
      }
    }
    lottieController = AnimationController(
      vsync: this,
    );

    if (gameController.gameMode == GameMode.training || gameController.gameMode == GameMode.repeating) {
      lottieController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.poseController.playAnimation.value = false;
          lottieController.value = 0;
          if (gameController.gameMode == GameMode.training) {
            if (gameController.repeatNumber.value == gameController.currentRepetitionCounter) {
              poseController.posePerformance[gameController.currentMode!] = true;
              Get.back();
              return;
            }
          } else {
            if (gameController.repeatGameModeCounter.value == gameController.currentRepetitionCounter) {
              Get.back();
              return;
            }
          }

          Timer(
            const Duration(seconds: 1),
            () {
              var poseCalculator = new PoseCalculationHelper();
              cameraViewController.isPoseImageShowing = true;
              Timer(
                const Duration(seconds: 3),
                () {
                  resetPosesDict();
                  if (gameController.gameMode == GameMode.training) {
                    poseCalculator.setNewTrainingGameModePose();
                  } else if (gameController.gameMode == GameMode.repeating) {
                    poseCalculator.setNewRepeatingGameModePose();
                  }
                  cameraViewController.isProgressBarShowing = true;
                  cameraViewController.isPoseImageShowing = false;
                },
              );
            },
          );
        }
      });

      final timer = Timer(
        const Duration(seconds: 3),
        () {
          cameraViewController.isOnboardingImageShowing = false;
          cameraViewController.isProgressBarShowing = true;
          //cameraViewController.isPoseImageShowing = true;
        },
      );
    }

    if (gameController.gameMode == GameMode.dayAndNight) {
      lottieController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.poseController.playAnimation.value = false;
          lottieController.value = 0;
          if (gameController.currentRepetitionCounter == gameController.dayNightCounter.value) {
            Get.back();
            return;
          }
          Timer(
            const Duration(seconds: 1),
            () {
              cameraViewController.isPoseImageShowing = true;
              Timer(
                const Duration(seconds: 3),
                () {
                  resetPosesDict();
                  cameraViewController.isProgressBarShowing = true;
                  cameraViewController.isPoseImageShowing = false;
                },
              );
            },
          );
        }
      });

      final timer = Timer(
        const Duration(seconds: 3),
        () {
          cameraViewController.isOnboardingImageShowing = false;
          cameraViewController.isProgressBarShowing = true;
          //cameraViewController.isPoseImageShowing = true;
        },
      );
    }
    _startLiveFeed();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return _liveFeedBody();
  }

  Widget _liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    BasePose targetPose;
    double progressBarValue = 0;

    if (cameraViewController.isProgressBarShowing) {
      if (!poseController.onboardingCompleted) {
        progressBarValue = ((poseController.poseCalculationDict[BasePose.leftArmNeutral] as double) + (poseController.poseCalculationDict[BasePose.rightArmNeutral] as double) + (poseController.poseCalculationDict[BasePose.leftLegNeutral] as double) + (poseController.poseCalculationDict[BasePose.rightLegNeutral] as double)) / 12;
      } else if (poseController.onboardingCompleted && (gameController.gameMode == GameMode.training || gameController.gameMode == GameMode.repeating)) {
        targetPose = poseController.wantedPose as BasePose;
        progressBarValue = (poseController.poseCalculationDict[targetPose] as double) / 3;
      } else if (poseController.onboardingCompleted && gameController.gameMode == GameMode.dayAndNight) {
        progressBarValue = (poseController.dayNightDict[poseController.wantedDayNightPosition] as double) / 3;
      }
    }

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_controller!),
          if (widget.customPaint != null) widget.customPaint!,
          true
              ? Positioned(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 25),
                      child: Text(
                        // poseController.wantedPose!.toStr,
                        poseController.onboardingCompleted ? "Zauzimanje poze" : "Onboarding",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                )
              : Container(),
          poseController.wantedPose != null
              ? Positioned(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 25),
                      child: Text(
                        poseController.wantedPose!.toStr,
                        //poseController.wantedDayNightPosition.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                )
              : Container(),
          cameraViewController.isOnboardingImageShowing
              ? Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/onboarding1.png'),
                  ),
                )
              : Container(),
          cameraViewController.isPoseImageShowing
              ? Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/onboarding3.png'),
                  ),
                )
              : Container(),
          cameraViewController.isProgressBarShowing
              ? Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: LinearProgressIndicator(
                        value: progressBarValue,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 40,
                      ),
                    ),
                  ),
                )
              : Container(),
          AnimationOverlay(lottieController: lottieController),
        ],
      ),
    );
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _processCameraImage(CameraImage image) async {
    cameraViewController.maxX = image.height;
    cameraViewController.maxY = image.width;

    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    final camera = cameras[_cameraIndex];
    final imageRotation = InputImageRotationMethods.fromRawValue(camera.sensorOrientation) ?? InputImageRotation.Rotation_0deg;

    final inputImageFormat = InputImageFormatMethods.fromRawValue(image.format.raw) ?? InputImageFormat.NV21;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }

  void resetPosesDict() {
    poseController.poseCalculationDict.forEach((name, value) => poseController.poseCalculationDict[name] = 0);
  }
}
