import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:Lottie.asset("assets/lotties/camera-roll.json"),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Prednjom i stražnjom kamerom možeš snimati pokret tijela",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
