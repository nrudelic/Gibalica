import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/controllers/settings_controller.dart';

import '../../color_palette.dart';

class Screening4 extends StatefulWidget {
  Screening4({Key? key}) : super(key: key);

  @override
  State<Screening4> createState() => _Screening4State();
}

class _Screening4State extends State<Screening4> {
  final playerController = Get.find<PlayerController>();
  final settingsController = Get.find<SettingsController>();
  var colors = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Text(
                    "Prilagodi svoj trening",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    "Odaberi vježbe",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  playerController.leftHandPref.value = !playerController.leftHandPref.value;
                                  settingsController.gibalicaBox.put("leftHandPref", playerController.leftHandPref.value);
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return Obx(
                                    () => CircleAvatar(
                                      child: SvgPicture.asset("assets/Hand_Left.svg"),
                                      backgroundColor: playerController.leftHandPref.value ? ColorPalette.green : Colors.grey.shade400,
                                      minRadius: constraint.biggest.height,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Lijeva ruka", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  playerController.rightHandPref.value = !playerController.rightHandPref.value;
                                  settingsController.gibalicaBox.put("rightHandPref", playerController.rightHandPref.value);
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return Obx(
                                    () => CircleAvatar(
                                      child: SvgPicture.asset("assets/Hand_Right.svg"),
                                      backgroundColor: playerController.rightHandPref.value ? ColorPalette.green : Colors.grey.shade400,
                                      minRadius: constraint.biggest.height,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Desna ruka", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  playerController.squatPref.value = !playerController.squatPref.value;
                                  settingsController.gibalicaBox.put("squatPref", playerController.squatPref.value);
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return Obx(
                                    () => CircleAvatar(
                                      child: SvgPicture.asset("assets/Gibalica_squat.svg"),
                                      backgroundColor: playerController.squatPref.value ? ColorPalette.green : Colors.grey.shade400,
                                      minRadius: constraint.biggest.height,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Čučanj", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  playerController.leftLegPref.value = !playerController.leftLegPref.value;
                                  settingsController.gibalicaBox.put("leftLegPref", playerController.leftLegPref.value);
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return Obx(
                                    () => CircleAvatar(
                                      child: SvgPicture.asset("assets/Leg_Left.svg"),
                                      backgroundColor: playerController.leftLegPref.value ? ColorPalette.green : Colors.grey.shade400,
                                      minRadius: constraint.biggest.height,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Lijeva noga", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  playerController.rightLegPref.value = !playerController.rightLegPref.value;
                                  settingsController.gibalicaBox.put("rightLegPref", playerController.rightLegPref.value);
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return Obx(
                                    () => CircleAvatar(
                                      child: SvgPicture.asset("assets/Leg_Right.svg"),
                                      backgroundColor: playerController.rightLegPref.value ? ColorPalette.green : Colors.grey.shade400,
                                      minRadius: constraint.biggest.height,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Desna noga", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
