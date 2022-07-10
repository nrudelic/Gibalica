import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/constants.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

Widget buildPopupDialog(GameController gameController, StateSetter setState, String title) {
  var settingsController = Get.find<SettingsController>();

  title = resolveTitle(title, settingsController.language.value, settingsController.isUppercase.value);
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
            style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0),),
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
              style:  TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0)),
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
                    child:  Text(
                      '1',
                      style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
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
                    child:  Text(
                      '3',
                      style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
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
                    child:  Text(
                      '5',
                      style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
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
                      style:  TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
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
                      style:  TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
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
                style:  TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white.withOpacity(0), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

String resolveTitle(String title, Language language, bool isUpper) {
  String ret = title;

  if (language == Language.English) {
    ret = TrainingTitleEnglish[title]!;
  }

  if (isUpper) {
    return ret.toUpperCase();
  }
  return ret;
}
