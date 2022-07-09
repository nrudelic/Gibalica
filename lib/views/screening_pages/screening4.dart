import 'package:auto_size_text/auto_size_text.dart';
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
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: AutoSizeText(
                    "PrilagodiSvojTrening".tr,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                  ),
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  "OdaberiVježbe".tr,
                  style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue),
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
                            flex: 3,
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
                          Expanded(flex: 1, child: FittedBox(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("LijevaRuka".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)),
                          )))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(flex: 3, 
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
                          Expanded(flex: 1, child: FittedBox(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("DesnaRuka".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)),
                          )))
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
                          Expanded(flex: 3, 
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
                          Expanded(flex: 1, child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("Čučanj".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)),
                          ))
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
                          Expanded(flex: 3, 
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
                          Expanded(flex: 1, child: FittedBox(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("LijevaNoga".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)),
                          )))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(flex: 3, 
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
                          Expanded(flex: 1, child: FittedBox(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("DesnaNoga".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)),
                          )))
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
