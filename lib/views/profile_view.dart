import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/views/screening_pages.dart';
import 'package:gibalica/views/training_info_view.dart';

import '../color_palette.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var playerController = Get.find<PlayerController>();
  var settingsController = Get.find<SettingsController>();
  var colors = [ColorPalette.green, ColorPalette.green, ColorPalette.green, ColorPalette.green, ColorPalette.green];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.darkBlue),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      "<",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.yellow),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => const ScreeningPages());
                  },
                  icon: const Icon(Icons.mode_edit_outline),
                ),
              ),
            )
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      playerController.playerName as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: ColorPalette.darkBlue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
                    child: const Divider(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
                SvgPicture.asset("assets/statistics.svg"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Podatci o vježbanju"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const TrainingInfoView());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.lightBlue),
                        child: const Text(
                          'Klikni za više!',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
              child: const Divider(),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
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
                                            backgroundColor: playerController.leftHandPref.value ? ColorPalette.green : ColorPalette.pink,
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
                                            backgroundColor: playerController.rightHandPref.value ? ColorPalette.green : ColorPalette.pink,
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
                                            backgroundColor: playerController.squatPref.value ? ColorPalette.green : ColorPalette.pink,
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
                                            backgroundColor: playerController.leftLegPref.value ? ColorPalette.green : ColorPalette.pink,
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
                                            backgroundColor: playerController.rightLegPref.value ? ColorPalette.green : ColorPalette.pink,
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
            ),
          ]),
        ),
      ),
    );
  }
}
