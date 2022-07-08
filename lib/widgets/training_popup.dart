import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

Widget buildPopupDialog(GameController gameController, StateSetter setState, String title) {
  return SimpleDialog(
    backgroundColor: ColorPalette.darkBlue,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    title: SizedBox(
      width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * 0.5,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    ),
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "BrojPonavljanjaVježbe".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  gameController.repeatNumber.value = 1;
                },
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber.value == 1 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  gameController.repeatNumber.value = 3;
                },
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber.value == 3 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  gameController.repeatNumber.value = 5;
                },
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber.value == 5 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '5',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "GibalicaGleda".tr,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  gameController.gameType.value = GameType.personal;
                },
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType.value == GameType.personal ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: Text(
                      "Mene".tr,
                      style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  gameController.gameType.value = GameType.cards;
                },
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType.value == GameType.cards ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: Text(
                      "Kartice".tr,
                      style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              gameController.currentRepetitionCounter = 0;
              Get.to(
                () => PoseDetectorView(),
                transition: Transition.fadeIn,
              );
            },
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.darkBlue)),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: ColorPalette.green),
              child: Text(
                "Igraj".tr,
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
