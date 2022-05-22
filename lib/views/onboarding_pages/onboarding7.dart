import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              children: const [
                Text(
                  "PONAVLJANJE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  "igra pamćenja redoslijeda vježbi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}
