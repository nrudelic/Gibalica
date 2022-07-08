import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

class BothHandsTraining extends StatefulWidget {
  const BothHandsTraining({Key? key}) : super(key: key);

  @override
  State<BothHandsTraining> createState() => _BothHandsTrainingState();
}

class _BothHandsTrainingState extends State<BothHandsTraining> {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.2,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "LijevaI".tr,
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    "Desna".tr,
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    "Ruka".tr,
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottie.asset("assets/lotties/hand-clap.json"),
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
                                gameController.possiblePoses = [BasePose.rightArmUp, BasePose.leftArmUp];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftAndRightArmUp;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna ruka - u vis')));
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        gameController.isPoseFinished['leftAndRightArmUp']!.value ? "assets/HANDS_up_dark.svg" : "assets/HANDS_up_light.svg",
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "UVis".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
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
                                gameController.possiblePoses = [BasePose.rightArmMiddle, BasePose.leftArmMiddle];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftAndRightArmMiddle;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna ruka - sa strane')));
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        gameController.isPoseFinished['leftAndRightArmMiddle']!.value ? "assets/HANDS_onside_dark.svg" : "assets/HANDS_onside_light.svg",
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "SaStrane".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
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
                                gameController.possiblePoses = [BasePose.leftArmUpRightArmUp, BasePose.leftArmMiddleRightArmMiddle];
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      gameController.gameMode = GameMode.training;
                                      gameController.repeatNumber.value = 3;
                                      gameController.gameType.value = GameType.personal;
                                      gameController.currentMode = GamePlayModes.leftAndRightArmUpAndMiddleSamePosition;

                                      return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna ruka - u vis i sa strane isti položaj')));
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        gameController.isPoseFinished['leftAndRightArmUpAndMiddleSamePosition']!.value ? "assets/HANDS_equally_dark.svg" : "assets/HANDS_equally_light.svg",
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "UVisISaStraneIstiPoložaj".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
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
                                gameController.possiblePoses = [BasePose.leftArmMiddleRightArmUp, BasePose.leftArmUpRightArmMiddle];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftAndRightArmUpAndMiddleDiffPosition;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna ruka - u vis i sa strane razičiti položaj')));
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        gameController.isPoseFinished['leftAndRightArmUpAndMiddleDiffPosition']!.value ? "assets/HANDS_differently_dark.svg" : "assets/HANDS_differently_light.svg",
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "UVisISaStraneRazičitiPoložaj".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
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
                                gameController.possiblePoses = [BasePose.rightArmMiddle, BasePose.rightArmUp, BasePose.leftArmMiddle, BasePose.leftArmUp, BasePose.leftArmMiddleRightArmMiddle, BasePose.leftArmUpRightArmMiddle, BasePose.leftArmUpRightArmUp, BasePose.leftArmUpRightArmUp];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    gameController.gameMode = GameMode.training;
                                    gameController.repeatNumber.value = 3;
                                    gameController.gameType.value = GameType.personal;
                                    gameController.currentMode = GamePlayModes.leftAndRightArmAll;

                                    return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna ruka - sve')));
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        gameController.isPoseFinished['leftAndRightArmAll']!.value ? "assets/HANDS_all_dark.svg" : "assets/HANDS_all_light.svg",
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "Sve".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalette.darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
                              ),
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
        )
      ]),
    );
  }
}
