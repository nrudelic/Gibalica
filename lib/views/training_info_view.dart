import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/controllers/pose_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:core';

import '../controllers/game_controller.dart';

class TrainingInfoView extends StatefulWidget {
  const TrainingInfoView({Key? key}) : super(key: key);

  @override
  State<TrainingInfoView> createState() => _TrainingInfoViewState();
}

class _TrainingInfoViewState extends State<TrainingInfoView> {
  late PoseController poseController;
  double leftArmProgress = 0;
  double rightArmProgress = 0;
  double leftAndRightArmProgress = 0;
  double legsProgress = 0;
  double legsAndSquatProgress = 0;
  double allProgress = 0;

  @override
  void initState() {
    super.initState();
    poseController = Get.find<PoseController>();
    print(poseController.posePerformance);

    leftArmProgress = (((poseController.posePerformance[GamePlayModes.leftArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftArmUpAndMiddle] as bool) ? 1 : 0)) / 3;
    rightArmProgress = (((poseController.posePerformance[GamePlayModes.rightArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightArmUpAndMiddle] as bool) ? 1 : 0)) / 3;
    leftAndRightArmProgress = (((poseController.posePerformance[GamePlayModes.leftAndRightArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleSamePosition] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmAll] as bool) ? 1 : 0)) / 5;

    legsProgress = (((poseController.posePerformance[GamePlayModes.leftLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.legGap] as bool) ? 1 : 0)) / 4;
    legsAndSquatProgress = (legsProgress * 4 + ((poseController.posePerformance[GamePlayModes.squat] as bool) ? 1 : 0)) / 5;
    allProgress = ((((poseController.posePerformance[GamePlayModes.leftArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftArmUpAndMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightArmUpAndMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmMiddle] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleSamePosition] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightArmAll] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.rightLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.leftAndRightLegUp] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.legGap] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.squat] as bool) ? 1 : 0) + ((poseController.posePerformance[GamePlayModes.all] as bool) ? 1 : 0)) / 17);
  }

  @override
  Widget build(BuildContext context) {
    var playerController = Get.find<PlayerController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.darkBlue),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: FittedBox(
                    child: Icon(Icons.navigate_before),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraint) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            playerController.avatarAssetPath.value,
                          ),
                          minRadius: constraint.biggest.height,
                        );
                      }),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: AutoSizeText(
                          playerController.playerName as String,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: ColorPalette.darkBlue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
                      child: const Divider(),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: MediaQuery.of(context).size.width * 0.23,
                        lineWidth: MediaQuery.of(context).size.width * 0.05,
                        animation: true,
                        percent: (leftArmProgress + leftAndRightArmProgress + rightArmProgress) / 3,
                        center: CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.16,
                          lineWidth: MediaQuery.of(context).size.width * 0.05,
                          animation: true,
                          percent: legsAndSquatProgress,
                          center: CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.09,
                          lineWidth: MediaQuery.of(context).size.width * 0.05,
                            animation: true,
                            percent: allProgress,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: ColorPalette.green,
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: ColorPalette.yellow,
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: ColorPalette.pink,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: AutoSizeText("GornjiDioTijela".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: ColorPalette.pink,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: FittedBox(
                                  child: AutoSizeText(((leftArmProgress + leftAndRightArmProgress + rightArmProgress) / 3 * 100).toInt().toString() + " %",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ColorPalette.darkBlue,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: AutoSizeText("DonjiDioTijela".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: ColorPalette.yellow,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: FittedBox(
                                  child: AutoSizeText((legsAndSquatProgress * 100).toInt().toString() + " %",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ColorPalette.darkBlue,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: AutoSizeText("Sve".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: ColorPalette.green,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: FittedBox(
                                  child: AutoSizeText((allProgress * 100).toInt().toString() + " %",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ColorPalette.darkBlue,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(child: AutoSizeText("LijevaRuka".tr, textAlign: TextAlign.center, style: const TextStyle(color: ColorPalette.darkBlue))),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: leftArmProgress,
                                      progressColor: ColorPalette.pink,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(child: AutoSizeText("DesnaRuka".tr, textAlign: TextAlign.center, style: const TextStyle(color: ColorPalette.darkBlue))),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: rightArmProgress,
                                      progressColor: ColorPalette.pink,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(
                                      child: AutoSizeText(
                                        "LijevaIDesnaRuka".tr,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: ColorPalette.darkBlue),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: leftAndRightArmProgress,
                                      progressColor: ColorPalette.pink,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(child: AutoSizeText("Noge".tr, textAlign: TextAlign.center, style: const TextStyle(color: ColorPalette.darkBlue))),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: legsProgress,
                                      progressColor: ColorPalette.yellow,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(child: AutoSizeText("NogeIČučanj".tr, textAlign: TextAlign.center, style: const TextStyle(color: ColorPalette.darkBlue))),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: legsAndSquatProgress,
                                      progressColor: ColorPalette.yellow,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(child: AutoSizeText("Sve".tr, textAlign: TextAlign.center, style: const TextStyle(color: ColorPalette.darkBlue))),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 20.0,
                                      percent: allProgress,
                                      progressColor: ColorPalette.green,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
