import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/device_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:gibalica/helpers/localization_test.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

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

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    // Fill device information into controller
    deviceController.deviceType = MediaQuery.of(context).size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
    log("Device type: ${deviceController.deviceType}");
    deviceController.width = MediaQuery.of(context).size.width;
    deviceController.height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'test'.tr,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (isEnglish) {
                    var locale = const Locale('hr', 'HR');
                    Get.updateLocale(locale);
                    isEnglish = !isEnglish;
                  } else {
                    var locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                    isEnglish = !isEnglish;
                  }
                },
                child: const Text("Change language")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(PoseDetectorView());
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: const Card(
                  color: Colors.blueGrey,
                  elevation: 10,
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Pose detection",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
