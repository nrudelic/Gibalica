import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/main.dart';

class Screening3 extends StatefulWidget {
  const Screening3({Key? key}) : super(key: key);

  @override
  State<Screening3> createState() => _Screening3State();
}

class _Screening3State extends State<Screening3> {
  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: AutoSizeText(
              "KojiProgramVježbeŽeliš".tr,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: AutoSizeText(
            "OdaberiProgram".tr,
            style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue),
          ),
        ),
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () {
                          playerController.exerciseProgram.value = ExerciseProgram.all;
                          playerController.leftHandPref.value = true;
                          playerController.rightHandPref.value = true;
                          playerController.leftLegPref.value = true;
                          playerController.rightLegPref.value = true;
                          playerController.squatPref.value = true;
                          settingsController.gibalicaBox.put("leftHandPref", playerController.leftHandPref.value);
                          settingsController.gibalicaBox.put("rightHandPref", playerController.rightHandPref.value);
                          settingsController.gibalicaBox.put("squatPref", playerController.squatPref.value);
                          settingsController.gibalicaBox.put("leftLegPref", playerController.leftLegPref.value);
                          settingsController.gibalicaBox.put("rightLegPref", playerController.rightLegPref.value);
                        },
                        child: LayoutBuilder(builder: (context, constraint) {
                          return Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: SvgPicture.asset("assets/Gibalica_all.svg"),
                                backgroundColor: playerController.exerciseProgram.value == ExerciseProgram.all ? ColorPalette.green : Colors.grey.shade300,
                                minRadius: constraint.biggest.height,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Expanded(flex: 2, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: AutoSizeText("Cijeli".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: GestureDetector(
                        onTap: () {
                          playerController.exerciseProgram.value = ExerciseProgram.special;
                          // settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_2_Girl2.svg");
                        },
                        child: LayoutBuilder(builder: (context, constraint) {
                          return Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: SvgPicture.asset("assets/Gibalica_special.svg"),
                                backgroundColor: playerController.exerciseProgram.value == ExerciseProgram.special ? ColorPalette.green : Colors.grey.shade300,
                                minRadius: constraint.biggest.height,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Expanded(flex: 4, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: AutoSizeText("Prilagođeni".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
