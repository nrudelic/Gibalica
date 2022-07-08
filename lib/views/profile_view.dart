import 'package:auto_size_text/auto_size_text.dart';
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
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.darkBlue),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: FittedBox(
                    child: Icon(Icons.navigate_before),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.yellow),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => const ScreeningPages(),                              transition: Transition.fadeIn,
);
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
                    child: AutoSizeText(
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
                    AutoSizeText("PodatciOVježbanju".tr, style: TextStyle(color: ColorPalette.darkBlue)),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const TrainingInfoView(),                              transition: Transition.fadeIn,
);
                      },
                      style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.lightBlue),
                        child: AutoSizeText(
                          "KlikniZaViše".tr,
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
                                AutoSizeText("LijevaRuka".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                AutoSizeText("DesnaRuka".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))
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
                                AutoSizeText("Čučanj".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))
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
                                AutoSizeText("LijevaNoga".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                AutoSizeText("DesnaNoga".tr, style: TextStyle(fontSize: 28, color: ColorPalette.darkBlue))
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
