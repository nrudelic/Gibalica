import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

class SingleLegTraining extends StatefulWidget {
  const SingleLegTraining({Key? key}) : super(key: key);

  @override
  State<SingleLegTraining> createState() => _SingleLegTrainingState();
}

class _SingleLegTrainingState extends State<SingleLegTraining> {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottie.asset("assets/lotties/footprint.json"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Noge".tr,
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 1,
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
                          gameController.possiblePoses = [BasePose.leftLegUp];
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              gameController.gameMode = GameMode.training;
                              gameController.repeatNumber.value = 3;
                              gameController.gameType.value = GameType.personal;
                              gameController.currentMode = GamePlayModes.leftLegUp;

                              return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Lijeva noga - u vis')));
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: Obx(
                                () => SvgPicture.asset(
                                  gameController.isPoseFinished['leftLegUp']!.value ? "assets/LEFT_LEG_up_dark.svg" : "assets/LEFT_LEG_up_light.svg",
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
                          "LijevaUVis".tr,
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
                          gameController.possiblePoses = [BasePose.rightLegUp];
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              gameController.gameMode = GameMode.training;
                              gameController.repeatNumber.value = 3;
                              gameController.gameType.value = GameType.personal;
                              gameController.currentMode = GamePlayModes.rightLegUp;

                              return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Desna noga u vis')));
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: Obx(
                                () => SvgPicture.asset(
                                  gameController.isPoseFinished['rightLegUp']!.value ? "assets/LEFT_LEG_up_dark.svg" : "assets/LEFT_LEG_up_light.svg",
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
                          "DesnaUVis".tr,
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
        )
      ]),
    );
  }
}
