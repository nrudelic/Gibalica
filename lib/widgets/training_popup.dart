import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/models/pose_model.dart';
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
            style: TextStyle(fontSize: 25, color: Colors.white),
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
          const Text(
            "Broj ponavljanja vježbe",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  gameController.repeatNumber.value = 1;
                },
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal:25, vertical: 15),
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
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal:25, vertical: 15),
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
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(horizontal:25, vertical: 15),
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
          const Text(
            "Gibalica gleda?",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  gameController.gameType.value = GameType.personal;
                },
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType.value == GameType.personal ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      'MENE',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  gameController.gameType.value = GameType.cards;
                },
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType.value == GameType.cards ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      'KARTICE',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              gameController.currentRepetitionCounter = 0;

              Get.to(() => PoseDetectorView());
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: ColorPalette.green),
              child: const Text(
                'IGRAJ',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
