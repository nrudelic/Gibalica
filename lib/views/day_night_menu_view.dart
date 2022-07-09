import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

import '../color_palette.dart';

class DayAndNightMenuView extends StatefulWidget {
  const DayAndNightMenuView({Key? key}) : super(key: key);

  @override
  State<DayAndNightMenuView> createState() => _DayAndNightMenuViewState();
}

class _DayAndNightMenuViewState extends State<DayAndNightMenuView> {
  var gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
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
                  child: FittedBox(
                    child: Icon(Icons.navigate_before),
                  ),
                ),
              ),
            ),
          ),
          title: FittedBox(
            child: AutoSizeText(
              "DanINoć".tr,
              style: TextStyle(color: ColorPalette.lightBlue, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AutoSizeText(
                        "BrojPonavljanjaVježbe".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorPalette.darkBlue,
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (gameController.dayNightCounter.value > 1) {
                                gameController.dayNightCounter.value--;
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.1,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.lightBlue),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.navigate_before,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorPalette.yellow),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Obx(
                                () => FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: AutoSizeText(
                                      gameController.dayNightCounter.value.toString(),
                                      // style: TextStyle(
                                      //   color: ColorPalette.darkBlue,
                                      //   fontWeight: FontWeight.bold,
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              gameController.dayNightCounter.value++;
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.1,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.lightBlue),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                  child: AutoSizeText(
                    "GibalicaGleda".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.darkBlue,
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: SvgPicture.asset("assets/Gibalica_standing.svg")),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              gameController.gameType.value = GameType.personal;
                            },
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: gameController.gameType.value == GameType.personal ? ColorPalette.pink : ColorPalette.darkBlue),
                                child: AutoSizeText(
                                  "Mene".tr,textScaleFactor:1,
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: SvgPicture.asset("assets/cards.svg")),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              gameController.gameType.value = GameType.cards;
                            },
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: gameController.gameType.value == GameType.cards ? ColorPalette.pink : ColorPalette.darkBlue),
                                child: AutoSizeText(
                                  "Kartice".tr,textScaleFactor:1,
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    gameController.currentRepetitionCounter = 0;

                    Get.to(
                      () => PoseDetectorView(),
                      transition: Transition.fadeIn,
                    );
                  },
                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                  child: Container(
                    //height: MediaQuery.of(context).size.width * 0.14,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.green),
                    child: AutoSizeText(
                      "IGRAJ".tr, textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
