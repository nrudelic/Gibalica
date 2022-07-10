import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/views/screening_pages.dart';

class MeetupView extends StatelessWidget {
  MeetupView({Key? key}) : super(key: key);
  var settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(112, 173, 71, 1),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.04),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                    child: SvgPicture.asset('assets/Gibalica_hello_white_circle.svg'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: AutoSizeText(
                      "SadaKadaZnašŠtoTeSveČekaMožemoKrenuti".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: settingsController.isNormalContrast.isFalse ? Colors.yellow : Colors.white,
                        background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      Get.off(
                        () => const ScreeningPages(),
                        transition: Transition.fadeIn,
                      );
                    },
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.green)),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white),
                      child: AutoSizeText(
                        "UpoznajmoSe".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                          background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
