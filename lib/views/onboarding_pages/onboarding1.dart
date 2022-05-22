import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset('assets/Gibalica_running.svg'),//Image.asset('assets/images/Gibalica_running.png'),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Aplikacija služi za vježbanje i učenje",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
