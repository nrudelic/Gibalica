import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../color_palette.dart';

class Onboarding7 extends StatelessWidget {
  const Onboarding7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Center(
                    child: AutoSizeText(
                      "IgraPamćenjaRedoslijedaVježbi".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue),
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
