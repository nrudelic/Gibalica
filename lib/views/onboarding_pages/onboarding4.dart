import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Lottie.asset("assets/lotties/three-points.json"),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Gibalica ti nudi 3 igre...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
