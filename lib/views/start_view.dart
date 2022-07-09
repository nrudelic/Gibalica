import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';

import 'onboarding_pages.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.lightBlue,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.04),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "Gibalica".tr,
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "KažeBok".tr,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset('assets/Gibalica_hello_white_circle.svg'),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: AutoSizeText(
                        "Veselim se našem druženju kroz vježbu",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       child: AutoSizeText(
                  //         "DragoMiTeVidjetiOvdje".tr,
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(fontSize: 30, color: Colors.white),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: AutoSizeText(
                  //         "DobroDošaola".tr,
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(fontSize: 30, color: Colors.white),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Get.off(
                        () => OnboardingPages(0),
                        transition: Transition.fadeIn,
                      );
                    },
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorPalette.lightBlue)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white),
                      child: AutoSizeText(
                        "Kreni".tr,
                        style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue),
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
