import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/settings_controller.dart';

class EverythingTraining extends StatefulWidget {
  const EverythingTraining({Key? key}) : super(key: key);

  @override
  State<EverythingTraining> createState() => _EverythingTrainingState();
}

class _EverythingTrainingState extends State<EverythingTraining> {
  final GameController gameController = Get.find<GameController>();
  var settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Lottie.asset("assets/lotties/warm-up-guy.json"),
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  "Ruke i Noge".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
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
                                gameController.possiblePoses = [BasePose.leftArmMiddle, BasePose.leftArmUp, BasePose.rightArmMiddle, BasePose.rightArmUp, BasePose.leftLegUp, BasePose.rightLegUp, BasePose.gap, BasePose.leftArmUpRightArmMiddle, BasePose.leftArmUpRightArmUp, BasePose.leftArmMiddleRightArmUp, BasePose.leftArmMiddleRightArmMiddle, BasePose.squat];
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      gameController.gameMode = GameMode.training;
                                      gameController.repeatNumber.value = 3;
                                      gameController.gameType.value = GameType.personal;
                                      gameController.currentMode = GamePlayModes.all;

                                      return StatefulBuilder(builder: ((context, setState) => buildPopupDialog( setState, 'Sve')));
                                    });
                              },
                              child: LayoutBuilder(builder: (context, constraint) {
                                return CircleAvatar(
                                  child: Obx(
                                    () => SvgPicture.asset(
                                      gameController.isPoseFinished['all']!.value ? "assets/ALL_dark.svg" : "assets/ALL_light.svg",
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
                                "Sve".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
