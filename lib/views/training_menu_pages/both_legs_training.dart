import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottie.asset("assets/lotties/footprints.json"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "OBJE",
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "NOGE",
                    style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
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

                                      return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState)));
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset(
                                      "assets/LEGS_up_light.svg",
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "Lijeva ili desna u vis",
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
                                // gameController.possiblePoses = [BasePose.rightArmUp];
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     gameController.gameMode = GameMode.training;
                                //     gameController.repeatNumber.value = 3;
                                //     gameController.gameType.value = GameType.personal;
                                //     gameController.currentMode = GamePlayModes.legGap;

                                //     return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState)));
                                //   },
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset(
                                      "assets/LEGS_gap_light.svg",
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "Raskorak",
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
                                // gameController.possiblePoses = [BasePose.rightArmMiddle];
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     gameController.gameMode = GameMode.training;
                                //     gameController.repeatNumber.value = 3;
                                //     gameController.gameType.value = GameType.personal;
                                //     gameController.currentMode = GamePlayModes.squat;

                                //     return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState)));
                                //   },
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset(
                                      "assets/LEGS_squat_light.svg",
                                    ),
                                    backgroundColor: Colors.white,
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Center(
                              child: AutoSizeText(
                                "Čučanj",
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
            ],
          ),
        )
      ]),
    );
  }
}
