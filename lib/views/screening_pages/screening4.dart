import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/player_controller.dart';

class Screening4 extends StatefulWidget {
  Screening4({Key? key}) : super(key: key);

  @override
  State<Screening4> createState() => _Screening4State();
}

class _Screening4State extends State<Screening4> {
  final playerController = Get.find<PlayerController>();
  var colors = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Text(
                    "Prilagodi svoj trening",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    "Odaberi vježbe",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playerController.leftHandPref = !playerController.leftHandPref;
                                    if (playerController.leftHandPref) {
                                      colors[0] = Colors.blue.shade100;
                                    } else {
                                      colors[0] = Colors.white;
                                    }
                                  });
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset("assets/Hand_Left.svg"),
                                    backgroundColor: colors[0],
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Lijeva ruka", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playerController.rightHandPref = !playerController.rightHandPref;
                                    if (playerController.rightHandPref) {
                                      colors[1] = Colors.blue.shade100;
                                    } else {
                                      colors[1] = Colors.white;
                                    }
                                  });
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset("assets/Hand_Right.svg"),
                                    backgroundColor: colors[1],
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Desna ruka", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playerController.squatPref = !playerController.squatPref;
                                    if (playerController.squatPref) {
                                      colors[2] = Colors.blue.shade100;
                                    } else {
                                      colors[2] = Colors.white;
                                    }
                                  });
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset("assets/Gibalica_squat.svg"),
                                    backgroundColor: colors[2],
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Čučanj", style: TextStyle(fontSize: 28))
                        ],
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playerController.leftLegPref = !playerController.leftLegPref;
                                    if (playerController.leftLegPref) {
                                      colors[3] = Colors.blue.shade100;
                                    } else {
                                      colors[3] = Colors.white;
                                    }
                                  });
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset("assets/Leg_Left.svg"),
                                    backgroundColor: colors[3],
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Lijeva noga", style: TextStyle(fontSize: 28))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playerController.rightLegPref = !playerController.rightLegPref;
                                    if (playerController.rightLegPref) {
                                      colors[4] = Colors.blue.shade100;
                                    } else {
                                      colors[4] = Colors.white;
                                    }
                                  });
                                },
                                child: LayoutBuilder(builder: (context, constraint) {
                                  return CircleAvatar(
                                    child: SvgPicture.asset("assets/Leg_Right.svg"),
                                    backgroundColor: colors[4],
                                    minRadius: constraint.biggest.height,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const Text("Desna noga", style: TextStyle(fontSize: 28))
                        ],
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
