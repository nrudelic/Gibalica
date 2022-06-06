import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding8 extends StatelessWidget {
  const Onboarding8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SvgPicture.asset('assets/statistics.svg'),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Gibalica prati tvoj napredak za svaku od igara",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
