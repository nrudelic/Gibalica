import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset('assets/Gibalica_cards.svg'),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Umjesto vlastitim tijelom možeš vježbati i s karticama",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
