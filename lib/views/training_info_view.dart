import 'package:flutter/cupertino.dart';
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
    allProgress = ((((poseController.posePerformance[GamePlayModes.leftArmUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftArmMiddle] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftArmUpAndMiddle] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.rightArmUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.rightArmMiddle] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.rightArmUpAndMiddle] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightArmUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightArmMiddle] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleSamePosition] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightArmAll] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftLegUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.rightLegUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.leftAndRightLegUp] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.legGap] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.squat] as bool) ? 1 : 0) +
            ((poseController.posePerformance[GamePlayModes.all] as bool) ? 1 : 0)) /
        17);
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
                  child: Center(
                    child: Text(
                      "<",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (() => Get.to(() => const TrainingInfoView())),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(playerController.playerName as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: ColorPalette.darkBlue)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
                        child: const Divider(),
                      )
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 15.0,
                      animation: true,
                      percent: (leftArmProgress + leftAndRightArmProgress + rightArmProgress) / 3,
                      center: CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 15.0,
                        animation: true,
                        percent: legsAndSquatProgress,
                        center: CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 15.0,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Gornji dio tijela",
                            style: TextStyle(
                              color: ColorPalette.pink,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(((leftArmProgress + leftAndRightArmProgress + rightArmProgress) / 3 * 100).toInt().toString() + " %",
                              style: const TextStyle(
                                color: ColorPalette.darkBlue,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        const Text("Donji dio tijela",
                            style: TextStyle(
                              color: ColorPalette.yellow,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text((legsAndSquatProgress * 100).toInt().toString() + " %",
                              style: TextStyle(
                                color: ColorPalette.darkBlue,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        const Text("Sve",
                            style: TextStyle(
                              color: ColorPalette.green,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text((allProgress * 100).toInt().toString() + " %",
                              style: TextStyle(
                                color: ColorPalette.darkBlue,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex:4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Lijeva ruka"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: leftArmProgress,
                                progressColor: ColorPalette.pink,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Desna ruka"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: rightArmProgress,
                                progressColor: ColorPalette.pink,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Lijeva i desna ruka"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: leftAndRightArmProgress,
                                progressColor: ColorPalette.pink,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Noge"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: legsProgress,
                                progressColor: ColorPalette.yellow,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Noge i čučanj"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: legsAndSquatProgress,
                                progressColor: ColorPalette.yellow,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Sve"),
                              ),
                              LinearPercentIndicator(
                                width: 170.0,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 20.0,
                                percent: allProgress,
                                progressColor: ColorPalette.green,
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                        ],
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
