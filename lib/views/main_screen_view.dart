import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/views/day_night_menu_view.dart';
import 'package:gibalica/views/profile_view.dart';
import 'package:gibalica/views/repeating_menu_view.dart';
import 'package:gibalica/views/settings_view.dart';
import 'package:gibalica/views/training_info_view.dart';
import 'package:gibalica/views/training_view.dart';

import '../controllers/player_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  var playerController = Get.find<PlayerController>();
  var gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: (() => Get.to(
                                () => const ProfileView(),
                                transition: Transition.rightToLeftWithFade,
                              )),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                playerController.avatarAssetPath.value,
                              ),
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: (() {
                            Get.to(
                              () => const SettingsView(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          }),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Icon(
                              Icons.settings,
                              size: constraint.biggest.height,
                              color: ColorPalette.pink,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            gameController.gameMode = GameMode.training;
                            Get.to(
                              () => const TrainingView(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(child: SvgPicture.asset("assets/training_menu.svg")),
                              Positioned(
                                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.12, right: constraints.maxWidth * 0.40, top: constraints.maxHeight * 0.3, bottom: constraints.maxHeight * 0.3),
                                    child: Center(child: FittedBox(child: AutoSizeText("Trening".tr, style: const TextStyle(fontSize: 30,color: ColorPalette.darkBlue, fontWeight: FontWeight.bold)))),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            gameController.gameMode = GameMode.dayAndNight;
                            Get.to(
                              () => const DayAndNightMenuView(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(child: SvgPicture.asset("assets/day_night_menu.svg")),
                              Positioned(
                                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: constraints.maxWidth * 0.12, left: constraints.maxWidth * 0.38, top: constraints.maxHeight * 0.3, bottom: constraints.maxHeight * 0.3),
                                    child: Center(child: FittedBox(child: AutoSizeText("DanINoć".tr, style: const TextStyle(fontSize: 30,color: ColorPalette.darkBlue, fontWeight: FontWeight.bold)))),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            gameController.gameMode = GameMode.repeating;
                            Get.to(
                              () => const RepeatingMenuView(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(child: SvgPicture.asset("assets/repeating_menu.svg")),
                              Positioned(
                                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.12, right: constraints.maxWidth * 0.38, top: constraints.maxHeight * 0.3, bottom: constraints.maxHeight * 0.3),
                                    child: Center(child: FittedBox(child: AutoSizeText("PONAVLJANJE1".tr, style: const TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold)))),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
