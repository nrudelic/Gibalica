import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../color_palette.dart';

class Onboarding5 extends StatelessWidget {
  const Onboarding5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: SvgPicture.asset('assets/Gibalica_training.svg'),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                AutoSizeText(
                  "Trening".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: AutoSizeText(
                    "IgraSVježbamaZaRukeINoge".tr,
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
