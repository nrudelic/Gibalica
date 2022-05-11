// import 'dart:io';

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/lottie_animation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../main.dart';
import '../controllers/pose_controller.dart';

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

    lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.poseController.playAnimation.value = false;
        lottieController.value = 0;
      }
    });

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return _liveFeedBody();
  }

  Widget _liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    var targetPose = poseController.wantedPose;
    var progressBarValue = (poseController.poseCalculationDict[targetPose] as double) / 3;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_controller!),
          if (widget.customPaint != null) widget.customPaint!,
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  poseController.wantedPose!.toStr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                // child: Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: LiquidLinearProgressIndicator(
                //     value: progressBarValue,
                //     valueColor: AlwaysStoppedAnimation(Colors.green),
                //     backgroundColor: Colors.white,
                //     borderColor: Colors.green,
                //     borderWidth: 5.0,
                //     borderRadius: 12.0,
                //     direction: Axis.horizontal,
                //     center: Text(
                //       progressBarValue.toString() + "%",
                //       style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.black),
                //     ),
                //   ),
                // ),

                child: LinearProgressIndicator(
                  value: progressBarValue,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                  minHeight: 40,
                ),
              ),
            ),
          ),
          // Positioned(
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Align(
          //         alignment: Alignment.topRight,
          //         child: widget.poseController.onboardingCompleted
          //             ? const CircleAvatar(
          //                 backgroundColor: Colors.green,
          //               )
          //             : const CircleAvatar(
          //                 backgroundColor: Colors.red,
          //               )),
          //   ),
          // ),
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
}
