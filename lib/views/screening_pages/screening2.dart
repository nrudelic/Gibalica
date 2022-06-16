import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/main.dart';

class Screening2 extends StatefulWidget {
  const Screening2({Key? key}) : super(key: key);

  @override
  State<Screening2> createState() => _Screening2State();
}

class _Screening2State extends State<Screening2> {
  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: AutoSizeText(
              "Odaberi jedan od ponuđenih avatara koji ti se najviše sviđa",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: AutoSizeText(
              "Odaberi avatar",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_1_Girl1.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_1_Girl1.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_1_Girl1.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_1_Girl1.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_2_Girl2.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_2_Girl2.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_2_Girl2.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_2_Girl2.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_3_girl3.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_3_girl3.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_3_girl3.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_3_girl3.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_4_Boy1.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_4_Boy1.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_4_Boy1.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_4_Boy1.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_5_Boy2.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_5_Boy2.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_5_Boy2.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_5_Boy2.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playerController.avatarAssetPath.value = "assets/Avatar_6_Boy3.svg";
                            settingsController.gibalicaBox.put("avatarAssetPath", "assets/Avatar_6_Boy3.svg");
                            playerController.avatarChosen = true;
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Obx(
                              () => CircleAvatar(
                                child: SvgPicture.asset("assets/Avatar_6_Boy3.svg"),
                                backgroundColor: playerController.avatarAssetPath.value == "assets/Avatar_6_Boy3.svg" ? ColorPalette.green : Colors.white,
                                minRadius: constraint.biggest.height,
                              ),
                            );
                          }),
                        ),
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
