import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'everything_ready_view.dart';
import 'meetup_view.dart';

class ProfileActivationView extends StatefulWidget {
  const ProfileActivationView({Key? key}) : super(key: key);

  @override
  State<ProfileActivationView> createState() => _ProfileActivationViewState();
}

class _ProfileActivationViewState extends State<ProfileActivationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: IntroductionScreen(
            done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            onDone: () {
              Get.to(const EverythingReady());
            },
            onSkip: () {
              Get.to(const MeetupView());
            },
            showSkipButton: false,
            showNextButton: true,
            showBackButton: true,
            next: const Text(">"),
            back: const Text("<"),
            globalBackgroundColor: Colors.white,
            pages: [
              PageViewModel(
                image: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.stretch, children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Molim te podijelli sa mnom nekoliko informacija kako bih te bolje upoznala",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Sve informacije koje mi sada podijeliš moći češ kasnije promijeniti u postavkama",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Kako se zoveš?",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ]),
                ),
                body: "",
                titleWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 232, 161, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 5, color: Color.fromRGBO(255, 232, 161, 1)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: Color.fromRGBO(255, 232, 161, 1)),
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),
              ),
              PageViewModel(
                decoration: const PageDecoration(
                  imageFlex: 2,
                  bodyFlex: 3,
                ),
                image: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.stretch, children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Odaberi jedan od ponuđenih avatara koji ti se najviše sviđa",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Odaberi avatar",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ]),
                ),
                body: "",
                titleWidget: Column(
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
              ),
              PageViewModel(
                decoration: const PageDecoration(
                  imageFlex: 1,
                  bodyFlex: 2,
                ),
                image: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        "Prilagodi svoj trening",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Odaberi pozicije za vježbanje",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                body: "",
                useScrollView: false,
                titleWidget: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          // fit: FlexFit.tight,
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  print("4");
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Image.asset(
                                        "assets/images/Gibalica_standing.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const Expanded(flex: 2, child: Text("Stajanje", style: TextStyle(fontSize: 40)))
                                  ],
                                )),
                          )),
                      Expanded(
                          // fit: FlexFit.tight,
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  print("5");
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Image.asset("assets/images/Gibalica_sitting.png", fit: BoxFit.fitHeight),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Sjedenje",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    )
                                  ],
                                )),
                          )),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                decoration: const PageDecoration(
                  imageFlex: 2,
                  bodyFlex: 4,
                ),
                image: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.stretch, children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Prilagodi svoj trening",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Odaberi vježbe",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ]),
                ),
                body: "",
                useScrollView: false,
                titleWidget: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                                  print("1");
                                },
                                child: Image.asset("assets/images/Hand_Left.png",),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    print("2");
                                  },
                                  child: Image.asset("assets/images/Hand_Right.png")),
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  print("1");
                                },
                                child: Image.asset("assets/images/Gibalica_squat.png"),
                              ),
                            )),
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
                                    print("4");
                                  },
                                  child: Image.asset("assets/images/Leg_Left.png")),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    print("5");
                                  },
                                  child: Image.asset("assets/images/Leg_Right.png")),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
