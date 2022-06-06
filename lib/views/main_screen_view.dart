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
        body: Column(
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
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: (() => Get.to(() => const ProfileView())),
                        child: LayoutBuilder(builder: (context, constraint) {
                          return CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              playerController.avatarAssetPath!,
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
                          Get.to(() => const SettingsView());
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Stack(children: [
                        Positioned.fill(
                          child: GestureDetector(
                              onTap: () {
                                gameController.gameMode = GameMode.training;
                                Get.to(() => const TrainingView());
                              },
                              child:
                                  SvgPicture.asset("assets/training_menu.svg")),
                        ),
                        const Positioned(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.0),
                              child: Text("TRENING",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: ColorPalette.darkBlue,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )
                      ]),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          gameController.gameMode = GameMode.dayAndNight;
                          Get.to(() => const DayAndNightMenuView());
                        },
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: SvgPicture.asset(
                                    "assets/day_night_menu.svg")),
                            const Positioned(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 50.0),
                                  child: Text("DAN i NOĆ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: ColorPalette.darkBlue,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GestureDetector(
                                onTap: () {
                                  gameController.gameMode = GameMode.repeating;
                                  Get.to(() => const RepeatingMenuView());
                                },
                                child: SvgPicture.asset(
                                    "assets/repeating_menu.svg")),
                          ),
                          const Positioned(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("PONAVLJANJE",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: ColorPalette.darkBlue,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
