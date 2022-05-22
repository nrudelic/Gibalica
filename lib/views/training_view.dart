import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "TRENING",
              style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TrainingCategoryView(title: "LIJEVA RUKA"),
              const Divider(
                thickness: 3,
              ),
              TrainingCategoryView(title: "DESNA RUKA"),
              const Divider(
                thickness: 3,
              ),
              TrainingCategoryView(title: "LIJEVA NOGA"),
              const Divider(
                thickness: 3,
              ),
              TrainingCategoryView(title: "DESNA NOGA"),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainingCategoryView extends StatefulWidget {
  TrainingCategoryView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TrainingCategoryView> createState() => _TrainingCategoryViewState();
}

class _TrainingCategoryViewState extends State<TrainingCategoryView> {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(onTap: () {}, child: Image.asset("assets/images/Hand_Right.png")),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title.split(" ")[0],
                    style: const TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.title.split(" ")[1],
                    style: const TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          gameController.gameMode = GameMode.training;
                          gameController.repeatNumber = 1;
                          gameController.gameType = GameType.personal;

                          return StatefulBuilder(builder: ((context, setState) => _buildPopupDialog(gameController, setState)));
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: LayoutBuilder(builder: (context, constraint) {
                      return CircleAvatar(
                        child: Image.asset(
                          "assets/images/Avatar_1_Girl1.png",
                        ),
                        minRadius: constraint.biggest.height,
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: Image.asset(
                                "assets/images/Avatar_1_Girl1.png",
                              ),
                              minRadius: constraint.biggest.height,
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return CircleAvatar(
                              child: Image.asset(
                                "assets/images/Avatar_1_Girl1.png",
                              ),
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
        )
      ]),
    );
  }

  Widget _buildPopupDialog(GameController gameController, StateSetter setState) {
    print(gameController.repeatNumber);
    return SimpleDialog(
      backgroundColor: ColorPalette.darkBlue,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      title: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
            Text(
              "Vježba odrađena",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Icon(
              Icons.star_outline,
            )
          ]),
          const Divider(
            thickness: 2,
          )
        ],
      ),
      children: [
        Column(
          children: [
            const Text(
              "Broj ponavljanja vježbe",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      gameController.repeatNumber = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber == 1 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      gameController.repeatNumber = 3;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber == 3 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      gameController.repeatNumber = 5;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.repeatNumber == 5 ? ColorPalette.lightBlue : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      '5',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      gameController.gameType = GameType.personal;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType == GameType.personal ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      'OSOBNO',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      gameController.gameType = GameType.cards;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: (gameController.gameType == GameType.cards ? ColorPalette.pink : const Color.fromRGBO(26, 63, 103, 1))),
                    child: const Text(
                      'KARTICE',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(() => PoseDetectorView());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: ColorPalette.green),
                child: const Text(
                  'IGRAJ',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
