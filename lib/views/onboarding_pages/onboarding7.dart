import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../color_palette.dart';
import '../../controllers/settings_controller.dart';

class Onboarding7 extends StatelessWidget {
  const Onboarding7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  var settingsController = Get.find<SettingsController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SvgPicture.asset('assets/Gibalica_repeating.svg'),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex:1,
                  child: Center(
                    child: AutoSizeText(
                      "Ponavljanje".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,),
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Center(
                    child: AutoSizeText(
                      "IgraPamćenjaRedoslijedaVježbi".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
