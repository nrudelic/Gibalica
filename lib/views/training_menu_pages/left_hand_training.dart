import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

class LeftHandTraining extends StatefulWidget {
  const LeftHandTraining({Key? key}) : super(key: key);

  @override
  State<LeftHandTraining> createState() => _LeftHandTrainingState();
}

class _LeftHandTrainingState extends State<LeftHandTraining> {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Lottie.asset("assets/lotties/backhand-index-pointing-left.json"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: AutoSizeText(
                    "Lijeva ruka",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () {
                                gameController.possiblePoses = [BasePose.leftArmUp];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftArmUp;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva ruka - u vis')));
                                  },
                                );
                              },
                              child: LayoutBuilder(builder: (context, constraint) {
                                return CircleAvatar(
                                  child: Obx(() => SvgPicture.asset(
                                        gameController.isPoseFinished['leftArmUp']!.value ? "assets/LEFT_HAND_up_dark.svg" : "assets/LEFT_HAND_up_light.svg",
                                      )),
                                  backgroundColor: Colors.white,
                                  minRadius: constraint.biggest.height,
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "UVis".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () {
                                gameController.possiblePoses = [BasePose.leftArmMiddle];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftArmMiddle;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva ruka - sa strane')));
                                  },
                                );
                              },
                              child: LayoutBuilder(builder: (context, constraint) {
                                return CircleAvatar(
                                  child: Obx(() => SvgPicture.asset(
                                        gameController.isPoseFinished['leftArmMiddle']!.value ? "assets/LEFT_HAND_onside_dark.svg" : "assets/LEFT_HAND_onside_light.svg",
                                      )),
                                  backgroundColor: Colors.white,
                                  minRadius: constraint.biggest.height,
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "SaStrane".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () {
                                gameController.possiblePoses = [BasePose.leftArmMiddle, BasePose.leftArmUp];
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      gameController.gameMode = GameMode.training;
                                      gameController.repeatNumber.value = 3;
                                      gameController.gameType.value = GameType.personal;
                                      gameController.currentMode = GamePlayModes.leftArmUpAndMiddle;

                                      return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva ruka - u vis i sa strane')));
                                    });
                              },
                              child: LayoutBuilder(builder: (context, constraint) {
                                return CircleAvatar(
                                  child: Obx(() => SvgPicture.asset(
                                        gameController.isPoseFinished['leftArmUpAndMiddle']!.value ? "assets/LEFT_HAND_plus_dark.svg" : "assets/LEFT_HAND_plus_light.svg",
                                      )),
                                  backgroundColor: Colors.white,
                                  minRadius: constraint.biggest.height,
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: FittedBox(
                                child: AutoSizeText(
                                  "UVisISaStrane".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorPalette.darkBlue, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
