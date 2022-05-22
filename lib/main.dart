import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/device_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/helpers/localization_test.dart';
import 'package:gibalica/views/start_view.dart';

import 'controllers/camera_view_controller.dart';
import 'controllers/game_controller.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalizationTest(), // your translations
      locale: const Locale('en', 'US'),
      title: 'Gibalica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gibalica Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PoseController poseController = Get.put(PoseController());
  final DeviceController deviceController = Get.put(DeviceController());
  final CameraViewController cameraViewController = Get.put(CameraViewController());
  final PlayerController playerController = Get.put(PlayerController());
  final GameController gameController = Get.put(GameController());

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(0, 176, 240, 1),
      body:  SafeArea(child: StartView()),

    );
  }
}