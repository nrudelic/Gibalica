import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/player_controller.dart';

class Screening3 extends StatefulWidget {
  const Screening3({Key? key}) : super(key: key);

  @override
  State<Screening3> createState() => _Screening3State();
}

class _Screening3State extends State<Screening3> {
  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              "Prilagodi svoj trening",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              "Odaberi pozicije za vježbanje",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          playerController.positionPlayMode = PositionPlayMode.standing;
                        },
                        child: SvgPicture.asset(
                          "assets/Gibalica_standing.svg",
                        ),
                      ),
                    ),
                    const Text("Stajanje", style: TextStyle(fontSize: 40))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          playerController.positionPlayMode = PositionPlayMode.sitting;
                        },
                        child: SvgPicture.asset(
                          "assets/Gibalica_sitting.svg",
                        ),
                      ),
                    ),
                    const Text("Sjedenje", style: TextStyle(fontSize: 40))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
