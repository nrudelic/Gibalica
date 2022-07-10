// import 'dart:io';

import 'dart:async';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/lottie_animation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../main.dart';
import '../color_palette.dart';
import '../controllers/camera_view_controller.dart';
import '../controllers/pose_controller.dart';
import '../helpers/pose_calculator.dart';

enum ScreenMode { liveFeed, gallery }

var showRepetitionInfo = true;

class CameraView extends StatefulWidget {
  CameraView({Key? key, required this.title, required this.customPaint, required this.onImage, this.initialDirection = CameraLensDirection.front}) : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  CameraLensDirection initialDirection;
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
    showRepetitionInfo = true;
    super.initState();
    gameController.isCurrentGameFinished = false;
    cameraViewController.cameraOn = true;
    if (cameraViewController.repetitionTimer != null) {
      cameraViewController.repetitionTimer!.cancel();
    }
    cameraViewController.repetitionTimer = null;
    widget.initialDirection = gameController.gameType.value == GameType.personal ? CameraLensDirection.front : CameraLensDirection.back;
    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == widget.initialDirection) {
        _cameraIndex = i;
      }
    }
    lottieController = AnimationController(
      vsync: this,
    );

    if (gameController.gameMode == GameMode.training) {
      lottieController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.poseController.playAnimation.value = false;
          lottieController.value = 0;
          if (gameController.gameMode == GameMode.training) {
            if (gameController.repeatNumber.value == gameController.currentRepetitionCounter) {
              poseController.posePerformance[gameController.currentMode!] = true;
              gameController.isPoseFinished[gameController.currentMode!.toStr]!.value = true;
              settingsController.gibalicaBox.put(gameController.currentMode!.toStr, true);

              gameController.isCurrentGameFinished = true;
              cameraViewController.isProgressBarShowing = false;
              cameraViewController.isPoseImageShowing = false;
              cameraViewController.isOnboardingImageShowing = false;

              //Get.back();
              //return;
            }
          } else {
            if (gameController.repeatGameModeCounter.value == gameController.currentRepetitionCounter) {
              Get.back();
              return;
            }
          }
          if (!gameController.isCurrentGameFinished) {
            Timer(
              const Duration(seconds: 1),
              () {
                if (poseController.onboardingCompleted) {
                  cameraViewController.isPoseImageShowing = true;
                } else {
                  cameraViewController.isOnboardingImageShowing = true;
                }
                Timer(
                  const Duration(seconds: 3),
                  () {
                    resetPosesDict();
                    cameraViewController.isProgressBarShowing = true;
                    if (poseController.onboardingCompleted) {
                      cameraViewController.isPoseImageShowing = false;
                    } else {
                      cameraViewController.isOnboardingImageShowing = false;
                    }
                  },
                );
              },
            );
          }
        }
      });

      Timer(
        const Duration(seconds: 3),
        () {
          cameraViewController.isOnboardingImageShowing = false;
          cameraViewController.isProgressBarShowing = true;
        },
      );
    } else if (gameController.gameMode == GameMode.dayAndNight) {
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
        },
      );
    } else if (gameController.gameMode == GameMode.repeating) {
      lottieController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.poseController.playAnimation.value = false;
          lottieController.value = 0;
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
                  if (cameraViewController.repetitionTimer != null) {
                    cameraViewController.resumeRepetitionTimer();
                  } else {
                    cameraViewController.startRepetitionTimer(gameController.repetitionTime.value);
                  }
                },
              );
            },
          );
        }
      });

      final timer = Timer(
        const Duration(seconds: 3),
        () {
          log("POSTAVLJAM TIMER");
          cameraViewController.isOnboardingImageShowing = false;
          cameraViewController.isProgressBarShowing = true;
          cameraViewController.startRepetitionTimer(gameController.repetitionTime.value);
        },
      );
    }
    _startLiveFeed();
  }

  @override
  void dispose() async {
    cameraViewController.cameraOn = false;
    _stopLiveFeed();

    lottieController.dispose();
    cameraViewController.cancelOnboardingTimer();
    cameraViewController.cancelTimer();
    cameraViewController.cancelInnerTimers();
    if (cameraViewController.repetitionTimer != null) cameraViewController.repetitionTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(showRepetitionInfo);
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
          cameraViewController.isOnboardingImageShowing
              ? Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white.withOpacity(0.8),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
                        child: SvgPicture.asset('assets/Gibalica_NEUTRAL.svg'),
                      ),
                    ),
                  ),
                )
              : Container(),
          cameraViewController.isPoseImageShowing
              ? Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: (gameController.gameMode == GameMode.training || gameController.gameMode == GameMode.repeating) ? Colors.white.withOpacity(0.8) : (poseController.wantedDayNightPosition == DayNightEnum.day ? const Color.fromRGBO(179, 223, 244, 1).withOpacity(0.8) : const Color.fromRGBO(16, 8, 56, 1).withOpacity(0.8)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
                        child: SvgPicture.asset((gameController.gameMode == GameMode.training || gameController.gameMode == GameMode.repeating) ? determinePoseImage() : determineDayNight()),
                      ),
                    ),
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
          gameController.isCurrentGameFinished ? GameFinishedMenu(context: context) : Container(),
          AnimationOverlay(lottieController: lottieController),
          cameraViewController.repetitionTimer != null && showRepetitionInfo && gameController.gameMode == GameMode.repeating
              ? Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        cameraViewController.repetitionTimer!.elapsed.inSeconds.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                )
              : Container(),
          showRepetitionInfo && gameController.gameMode == GameMode.repeating
              ? Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        gameController.currentRepetitionCounter.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                )
              : Container()
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

  String determinePoseImage() {
    switch (poseController.wantedPose) {
      case BasePose.leftArmNeutral:
        return 'assets/statistics.svg';
      case BasePose.leftArmMiddle:
        return 'assets/Gibalica_LEFT_ON_SIDE.svg';
      case BasePose.leftArmUp:
        return 'assets/Gibalica_LEFT_UP.svg';
      case BasePose.rightArmNeutral:
        return 'assets/statistics.svg';
      case BasePose.rightArmMiddle:
        return 'assets/Gibalica_RIGHT_ON_SIDE.svg';
      case BasePose.rightArmUp:
        return 'assets/Gibalica_RIGHT_UP.svg';
      case BasePose.leftLegNeutral:
        return 'assets/statistics.svg';
      case BasePose.leftLegUp:
        return 'assets/Gibalica_LEFT_LEG_UP.svg';
      case BasePose.rightLegNeutral:
        return 'assets/statistics.svg';
      case BasePose.rightLegUp:
        return 'assets/Gibalica_RIGHT_LEG_UP.svg';
      case BasePose.gap:
        return 'assets/Gibalica_LUNGES.svg';
      case BasePose.leftArmUpRightArmMiddle:
        return 'assets/Gibalica_RIGHT_ON_SIDE_LEFT_UP.svg';
      case BasePose.leftArmUpRightArmUp:
        return 'assets/Gibalica_RIGHT_LEFT_UP.svg';
      case BasePose.leftArmMiddleRightArmUp:
        return 'assets/Gibalica_LEFT_ON_SIDE_RIGHT_UP.svg';
      case BasePose.leftArmMiddleRightArmMiddle:
        return 'assets/Gibalica_RIGHT_LEFT_ON_SIDE.svg';
      case BasePose.squat:
        return 'assets/Gibalica_squat.svg';
      default:
        return 'assets/statistics.svg';
    }
  }

  determineDayNight() {
    switch (poseController.wantedDayNightPosition) {
      case DayNightEnum.day:
        return 'assets/Gibalica_DAY_no_background.svg';
      case DayNightEnum.night:
        return 'assets/Gibalica_NIGHT_no_background.svg';
      default:
        return 'assets/statistics.svg';
    }
  }
}

class GameFinishedMenu extends StatelessWidget {
  const GameFinishedMenu({
    Key? key,
    required this.context,
  }) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    showRepetitionInfo = false;

    return Positioned.fill(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gameController.gameMode == GameMode.repeating
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Tvoj rezultat: " + gameController.currentRepetitionCounter.toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  )
                : Container(),
            GestureDetector(
              onTap: () {
                cameraViewController.isPoseImageShowing = false;
                cameraViewController.isOnboardingImageShowing = false;
                cameraViewController.isProgressBarShowing = false;
                cameraViewController.isPoseSuccessfullAnimationShowing = false;
                cameraViewController.isOnboardingCompletedAnimationShowing = false;
                poseController.onboardingCompleted = false;
                cameraViewController.isOnboardingImageShowing = true;
                gameController.currentRepetitionCounter = 0;

                gameController.isCurrentGameFinished = false;
                cameraViewController.isOnboardingImageShowing = true;
                cameraViewController.repetitionTimer = null;
                Timer(
                  const Duration(seconds: 3),
                  () {
                    cameraViewController.isOnboardingImageShowing = false;
                    cameraViewController.isProgressBarShowing = true;
                    if (gameController.gameMode == GameMode.repeating) {
                      showRepetitionInfo = true;
                      cameraViewController.startRepetitionTimer(gameController.repetitionTime.value);
                    }
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.yellow),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SvgPicture.asset("assets/repeat.svg"),
                      ),
                      FittedBox(
                        child: AutoSizeText(
                          "PONOVI",
                          style: TextStyle(color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.green),
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SvgPicture.asset("assets/new_training.svg"),
                      ),
                      FittedBox(
                        child:  AutoSizeText(
                          "NOVI TRENING",
                          textAlign: TextAlign.center,
                          style:  TextStyle(color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
