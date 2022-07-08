import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/settings_controller.dart';

import 'main_screen_view.dart';

class EverythingReady extends StatelessWidget {
  EverythingReady({Key? key}) : super(key: key);
  var settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.yellow,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset('assets/Gibalica_hello_white_circle.svg'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    AutoSizeText(
                      "SuperSadaJeSveSpremno".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    settingsController.gibalicaBox.put("onboardingFinished", true);

                    Get.off(() => MainScreen(),                              transition: Transition.fadeIn,
);
                  },
                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.yellow)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white),
                    child: AutoSizeText(
                      "GibajSe".tr,
                      style: TextStyle(fontSize: 35, color: ColorPalette.darkBlue),
                    ),
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
