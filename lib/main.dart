import 'dart:async';
import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/device_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/helpers/localization.dart';
import 'package:gibalica/views/main_screen_view.dart';
import 'package:gibalica/views/start_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controllers/camera_view_controller.dart';
import 'controllers/game_controller.dart';
import 'helpers/hive_initializer.dart';

List<CameraDescription> cameras = [];
late final PoseController poseController;
late final DeviceController deviceController;
late final CameraViewController cameraViewController;
late final PlayerController playerController;
late final GameController gameController;
late final SettingsController settingsController;
late final bool isOnboardingFinished;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  cameras = await availableCameras();

  poseController = Get.put(PoseController());
  deviceController = Get.put(DeviceController());
  cameraViewController = Get.put(CameraViewController());
  playerController = Get.put(PlayerController());
  gameController = Get.put(GameController());
  settingsController = Get.put(SettingsController());

  await Hive.initFlutter();
  await getSettingsFromBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Localization(), // your translations
      title: 'Gibalica',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 25.0),
            bodyText2: TextStyle(fontSize: 20.0),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 0.9),
          child: child!,
        );
      },
      home: const MyHomePage(title: 'Gibalica'),
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
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isOnboardingFinished ? MainScreen() : const StartView();
  }
}
