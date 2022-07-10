import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../color_palette.dart';
import '../../controllers/settings_controller.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsController = Get.find<SettingsController>();

    return Column(
      children: [
        Expanded(
          child: Lottie.asset("assets/lotties/three-points.json"),
        ),
        Expanded(
          child: Center(
            child: AutoSizeText(
              "GibalicaTiNudi3Igre".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
