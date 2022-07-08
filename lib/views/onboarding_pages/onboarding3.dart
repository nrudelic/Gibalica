import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../color_palette.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset('assets/Gibalica_cards_with_Gibalica.svg'),
        ),
        Expanded(
          child: Center(
            child: AutoSizeText(
              "UmjestoVlastitimTijelomMožešVježbatiISKarticama".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue),
            ),
          ),
        )
      ],
    );
  }
}
