import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/onboarding1.png'),
            Column(
              children: const [
                Text(
                  "Aplikacija služi za",
                  style: TextStyle(fontSize: 40, color: Color.fromRGBO(36, 80, 128, 1)),
                ),
                Text(
                  "kaže bok!",
                  style: TextStyle(fontSize: 40, color: Color.fromRGBO(36, 80, 128, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}