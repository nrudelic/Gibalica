import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../color_palette.dart';

class Onboarding6 extends StatelessWidget {
  const Onboarding6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Lottie.asset('assets/lotties/day-night.json'),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "DanINoć".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: AutoSizeText(
                    "ZabavnaIgraKoncentracije".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue),
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
