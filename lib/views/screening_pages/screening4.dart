import 'package:flutter/material.dart';

class Screening4 extends StatelessWidget {
  const Screening4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex:1,
          child: Column(      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,

            children: const [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Text(
                  "Prilagodi svoj trening",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  "Odaberi vježbe",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex:3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print("1");
                              },
                              child: ClipRRect(
                                
                                child: Image.asset(
                                  "assets/images/Hand_Left.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text("Lijeva ruka")
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  print("2");
                                },
                                child: Image.asset("assets/images/Hand_Right.png")),
                          ),
                        ),
                        const Text("Desna ruka")
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
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
                          ),
                        ),
                        const Text("Čučanj")
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  print("4");
                                },
                                child: Image.asset("assets/images/Leg_Left.png")),
                          ),
                        ),
                        const Text("Desna noga")
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  print("5");
                                },
                                child: Image.asset("assets/images/Leg_Right.png")),
                          ),
                        ),
                        const Text("Desna noga")
                      ],
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
