import 'package:flutter/material.dart';

class Onboarding7 extends StatelessWidget {
  const Onboarding7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset('assets/images/Gibalica_repeating.png'),
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
