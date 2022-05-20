import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding6 extends StatelessWidget {
  const Onboarding6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "DAN I NOĆ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  "zabavna igra koncentracije",
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
