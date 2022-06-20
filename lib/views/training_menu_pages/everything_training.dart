import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';
import 'package:lottie/lottie.dart';

class EverythingTraining extends StatefulWidget {
  const EverythingTraining({Key? key}) : super(key: key);

  @override
  State<EverythingTraining> createState() => _EverythingTrainingState();
}

class _EverythingTrainingState extends State<EverythingTraining> {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottie.asset("assets/lotties/warm-up-guy.json"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "RUKE i",
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
                                gameController.possiblePoses = BasePose.values;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      gameController.gameMode = GameMode.training;
                                      gameController.repeatNumber.value = 3;
                                      gameController.gameType.value = GameType.personal;
                                      gameController.currentMode = GamePlayModes.all;

                                      return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState, 'Sve')));
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
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
                          ),
                          const Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                "SVE",
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
            ],
          ),
        )
      ]),
    );
  }
}
