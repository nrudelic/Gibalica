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

  poseController = Get.put(PoseController());
  deviceController = Get.put(DeviceController());
  cameraViewController = Get.put(CameraViewController());
  playerController = Get.put(PlayerController());
  gameController = Get.put(GameController());
  settingsController = Get.put(SettingsController());

  cameras = await availableCameras();

  await Hive.initFlutter();
  await getSettingsFromBox();

  runApp(const MyApp());
}

Future<void> getSettingsFromBox() async {
  var box = await Hive.openBox('gibalicaBox');
  settingsController.gibalicaBox = box;

  isOnboardingFinished = box.get("onboardingFinished", defaultValue: false);
  if (isOnboardingFinished) {
    playerController.avatarChosen = true;
  }
  playerController.playerName = box.get("playerName", defaultValue: "");
  playerController.avatarAssetPath.value = box.get("avatarAssetPath", defaultValue: "assets/Avatar_1_Girl1.svg");
  var playingPosition = box.get("positionPlayMode", defaultValue: "Standing");
  if (playingPosition == "Standing") {
    playerController.positionPlayMode = PositionPlayMode.standing;
  } else {
    playerController.positionPlayMode = PositionPlayMode.sitting;
  }

  playerController.leftHandPref.value = box.get("leftHandPref", defaultValue: false);
  playerController.rightHandPref.value = box.get("rightHandPref", defaultValue: false);
  playerController.squatPref.value = box.get("squatPref", defaultValue: false);
  playerController.leftLegPref.value = box.get("leftLegPref", defaultValue: false);
  playerController.rightLegPref.value = box.get("rightLegPref", defaultValue: false);

  settingsController.isLightMode.value = box.get('lightMode', defaultValue: true);
  settingsController.isBiggerText.value = box.get('isBiggetText', defaultValue: false);
  settingsController.isSoundOn.value = box.get('isSoundOn', defaultValue: true);

  var language = box.get("language", defaultValue: "Croatian");
  var typeOfLetters = box.get("uppercaseLetters", defaultValue: false);
  settingsController.isUppercase.value = typeOfLetters;
  if (language == "Croatian" && typeOfLetters) {
    var locale = const Locale('HR', 'HR');
    Get.updateLocale(locale);
    settingsController.language.value = Language.Croatian;
  } else if (language == "English" && typeOfLetters) {
    var locale = const Locale('EN', 'US');
    Get.updateLocale(locale);
    settingsController.language.value = Language.English;
  } else if (language == "Croatian" && !typeOfLetters) {
    var locale = const Locale('hr', 'HR');
    Get.updateLocale(locale);
    settingsController.language.value = Language.Croatian;
  } else {
    settingsController.language.value = Language.English;
    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
  }

  poseController.posePerformance[GamePlayModes.leftArmUp] = box.get("leftArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftArmMiddle] = box.get("leftArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftArmUpAndMiddle] = box.get("leftArmUpAndMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmUp] = box.get("rightArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmMiddle] = box.get("rightArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightArmUpAndMiddle] = box.get("rightArmUpAndMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUp] = box.get("leftAndRightArmUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmMiddle] = box.get("leftAndRightArmMiddle", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleSamePosition] = box.get("leftAndRightArmUpAndMiddleSamePosition", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition] = box.get("leftAndRightArmUpAndMiddleDiffPosition", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightArmAll] = box.get("leftAndRightArmAll", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftLegUp] = box.get("leftLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.rightLegUp] = box.get("rightLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.leftAndRightLegUp] = box.get("leftAndRightLegUp", defaultValue: false);
  poseController.posePerformance[GamePlayModes.legGap] = box.get("legGap", defaultValue: false);
  poseController.posePerformance[GamePlayModes.squat] = box.get("squat", defaultValue: false);
  poseController.posePerformance[GamePlayModes.all] = box.get("all", defaultValue: false);

  gameController.isPoseFinished['leftArmUp']!.value = box.get("leftArmUp", defaultValue: false);
  gameController.isPoseFinished['leftArmMiddle']!.value = box.get("leftArmMiddle", defaultValue: false);
  gameController.isPoseFinished['leftArmUpAndMiddle']!.value = box.get("leftArmUpAndMiddle", defaultValue: false);
  gameController.isPoseFinished['rightArmUp']!.value = box.get("rightArmUp", defaultValue: false);
  gameController.isPoseFinished['rightArmMiddle']!.value = box.get("rightArmMiddle", defaultValue: false);
  gameController.isPoseFinished['rightArmUpAndMiddle']!.value = box.get("rightArmUpAndMiddle", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUp']!.value = box.get("leftAndRightArmUp", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmMiddle']!.value = box.get("leftAndRightArmMiddle", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUpAndMiddleSamePosition']!.value = box.get("leftAndRightArmUpAndMiddleSamePosition", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmUpAndMiddleDiffPosition']!.value = box.get("leftAndRightArmUpAndMiddleDiffPosition", defaultValue: false);
  gameController.isPoseFinished['leftAndRightArmAll']!.value = box.get("leftAndRightArmAll", defaultValue: false);
  gameController.isPoseFinished['leftLegUp']!.value = box.get("leftLegUp", defaultValue: false);
  gameController.isPoseFinished['rightLegUp']!.value = box.get("rightLegUp", defaultValue: false);
  gameController.isPoseFinished['leftAndRightLegUp']!.value = box.get("leftAndRightLegUp", defaultValue: false);
  gameController.isPoseFinished['legGap']!.value = box.get("legGap", defaultValue: false);
  gameController.isPoseFinished['squat']!.value = box.get("squat", defaultValue: false);
  gameController.isPoseFinished['all']!.value = box.get("all", defaultValue: false);
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
    Timer(const Duration(seconds: 2), () => Get.off(isOnboardingFinished ? () => MainScreen() : () => const StartView()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).textScaleFactor);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.yellow,
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100)), color: Colors.white),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "BokJaSam".tr,
                        //poseController.wantedDayNightPosition.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue),
                      ),
                      AutoSizeText(
                        "Gibalica".tr,
                        //poseController.wantedDayNightPosition.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                      ),
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
