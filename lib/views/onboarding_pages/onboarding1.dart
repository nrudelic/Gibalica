import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: SvgPicture.asset('assets/Gibalica_running.svg'),
          ), //Image.asset('assets/images/Gibalica_running.png'),
        ),
        Expanded(
          child: Center(
            child: AutoSizeText(
              "appsluzi".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue),
            ),
          ),
        )
      ],
    );
  }
}
