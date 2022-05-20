import 'package:flutter/material.dart';

class Screening3 extends StatelessWidget {
  const Screening3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text(
            "Prilagodi svoj trening",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            "Odaberi pozicije za vježbanje",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {print("1");},
                    child: Image.asset(
                      "assets/images/Gibalica_standing.png",
                    ),
                  ),
                  const Text("Stajanje", style: TextStyle(fontSize: 40))
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {print("2");},
                    child: Image.asset(
                      "assets/images/Gibalica_sitting.png",
                    ),
                  ),
                  const Text("Sjedenje", style: TextStyle(fontSize: 40))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
