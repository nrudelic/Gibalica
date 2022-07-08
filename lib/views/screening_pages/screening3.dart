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
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: AutoSizeText(
              "KojiProgramVježbeŽeliš".tr,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: AutoSizeText(
              "OdaberiProgram".tr,
              style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    playerController.exerciseProgram.value = ExerciseProgram.all;
                                    playerController.leftHandPref.value = true;
                                    playerController.rightHandPref.value = true;
                                    playerController.leftLegPref.value = true;
                                    playerController.rightLegPref.value = true;
                                    playerController.squatPref.value = true;
                                    // settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_1_Girl1.svg");
                                  },
                                  child: LayoutBuilder(builder: (context, constraint) {
                                    return Obx(
                                      () => CircleAvatar(
                                        child: SvgPicture.asset("assets/Gibalica_all.svg"),
                                        backgroundColor: playerController.exerciseProgram.value == ExerciseProgram.all ? ColorPalette.green : Colors.grey.shade300,
                                        minRadius: constraint.biggest.height,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Expanded(flex: 2, child: AutoSizeText("Cijeli".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      playerController.exerciseProgram.value = ExerciseProgram.special;
                                      // settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_2_Girl2.svg");
                                    },
                                    child: LayoutBuilder(builder: (context, constraint) {
                                      return Obx(
                                        () => CircleAvatar(
                                          child: SvgPicture.asset("assets/Gibalica_special.svg"),
                                          backgroundColor: playerController.exerciseProgram.value == ExerciseProgram.special ? ColorPalette.green : Colors.grey.shade300,
                                          minRadius: constraint.biggest.height,
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 2, child: AutoSizeText("Prilagođeni".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
