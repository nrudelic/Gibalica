import 'package:flutter/material.dart';

class Screening2 extends StatelessWidget {
  const Screening2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text(
            "Odaberi jedan od ponuđenih avatara koji ti se najviše sviđa",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            "Odaberi avatar",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("1");
                    },
                    child: Image.asset("assets/images/Avatar_1_Girl1.png"),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        print("2");
                      },
                      child: Image.asset("assets/images/Avatar_2_Girl2.png")),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        print("3");
                      },
                      child: Image.asset("assets/images/Avatar_3_Girl3.png")),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        print("4");
                      },
                      child: Image.asset("assets/images/Avatar_4_Boy1.png")),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        print("5");
                      },
                      child: Image.asset("assets/images/Avatar_5_Boy2.png")),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        print("6");
                      },
                      child: Image.asset("assets/images/Avatar_6_Boy3.png")),
                )),
              ],
            )
          ],
        ),
      ],
    );
  }
}
