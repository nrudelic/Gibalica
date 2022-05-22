import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/player_controller.dart';

class Screening2 extends StatefulWidget {
  const Screening2({Key? key}) : super(key: key);

  @override
  State<Screening2> createState() => _Screening2State();
}

class _Screening2State extends State<Screening2> {
  var playerController = Get.find<PlayerController>();

  var colors = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

  void resetColors() {
    for (var i = 0; i < 6; i++) {
      colors[i] = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              "Odaberi jedan od ponuđenih avatara koji ti se najviše sviđa",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Odaberi avatar",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[0] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_1_Girl1.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_1_Girl1.svg"),
                              backgroundColor: colors[0],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[1] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_2_Girl2.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_2_Girl2.svg"),
                              backgroundColor: colors[1],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[2] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_3_girl3.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_3_girl3.svg"),
                              backgroundColor: colors[2],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[3] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_4_Boy1.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_4_Boy1.svg"),
                              backgroundColor: colors[3],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[4] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_5_Boy2.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_5_Boy2.svg"),
                              backgroundColor: colors[4],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              resetColors();
                              colors[5] = Colors.blue.shade100;
                              playerController.avatarAssetPath = "assets/Avatar_6_Boy3.svg";
                            });
                          },
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: SvgPicture.asset("assets/Avatar_6_Boy3.svg"),
                              backgroundColor: colors[5],
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
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
