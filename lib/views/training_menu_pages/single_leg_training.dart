import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/widgets/training_popup.dart';

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
                child: GestureDetector(onTap: () {}, child: SvgPicture.asset("assets/Hand_Left.svg")),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
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

                              return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState)));
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset(
                                "assets/Avatar_1_Girl1.svg",
                              ),
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
                          "Lijeva u vis",
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

                              return StatefulBuilder(builder: ((context, setState) => buildPopupDialog(gameController, setState)));
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset(
                                "assets/Avatar_1_Girl1.svg",
                              ),
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
                          "Desna u vis",
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
