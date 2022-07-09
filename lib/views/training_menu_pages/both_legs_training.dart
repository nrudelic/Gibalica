import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

class BothLegsTraining extends StatefulWidget {
  const BothLegsTraining({Key? key}) : super(key: key);

  @override
  State<BothLegsTraining> createState() => _BothLegsTrainingState();
}

class _BothLegsTrainingState extends State<BothLegsTraining> {
  final GameController gameController = Get.find<GameController>();
  final PlayerController playerController = Get.find<PlayerController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Lottie.asset("assets/lotties/footprints.json"),
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  "Obje Noge",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              (playerController.leftLegPref.value && playerController.rightLegPref.value)
                  ? Expanded(
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
                                      gameController.possiblePoses = [BasePose.leftArmUp, BasePose.rightLegUp];
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            gameController.gameMode = GameMode.training;
                                            gameController.repeatNumber.value = 3;
                                            gameController.gameType.value = GameType.personal;
                                            gameController.currentMode = GamePlayModes.leftAndRightLegUp;

                                            return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva i desna noga - u vis')));
                                          });
                                    },
                                    child: LayoutBuilder(builder: (context, constraint) {
                                      return CircleAvatar(
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            gameController.isPoseFinished['leftAndRightLegUp']!.value ? "assets/LEGS_up_dark.svg" : "assets/LEGS_up_light.svg",
                                          ),
                                        ),
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
                                      "LijevaIliDesnaUVis".tr,
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
                            child: Container(),
                          )
                        ],
                      ),
                    )
                  : Container(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (playerController.leftLegPref.value && playerController.rightLegPref.value)
                        ? Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: GestureDetector(
                                    onTap: () {
                                      gameController.possiblePoses = [BasePose.gap];
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          gameController.gameMode = GameMode.training;
                                          gameController.repeatNumber.value = 3;
                                          gameController.gameType.value = GameType.personal;
                                          gameController.currentMode = GamePlayModes.legGap;

                                          return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Raskorak')));
                                        },
                                      );
                                    },
                                    child: LayoutBuilder(builder: (context, constraint) {
                                      return CircleAvatar(
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            gameController.isPoseFinished['legGap']!.value ? "assets/LEGS_gap_dark.svg" : "assets/LEGS_gap_light.svg",
                                          ),
                                        ),
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
                                      "Raskorak".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: ColorPalette.darkBlue, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    (playerController.squatPref.value)
                        ? Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: GestureDetector(
                                    onTap: () {
                                      gameController.possiblePoses = [BasePose.squat];
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          gameController.gameMode = GameMode.training;
                                          gameController.repeatNumber.value = 3;
                                          gameController.gameType.value = GameType.personal;
                                          gameController.currentMode = GamePlayModes.squat;

                                          return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Čučanj')));
                                        },
                                      );
                                    },
                                    child: LayoutBuilder(builder: (context, constraint) {
                                      return CircleAvatar(
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            gameController.isPoseFinished['squat']!.value ? "assets/LEGS_squat_dark.svg" : "assets/LEGS_squat_light.svg",
                                          ),
                                        ),
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
                                      "Čučanj".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: ColorPalette.darkBlue, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
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
