import 'package:flutter/material.dart';

class Onboarding8 extends StatelessWidget {
  const Onboarding8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset('assets/images/Gibalica_training.png'),
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
