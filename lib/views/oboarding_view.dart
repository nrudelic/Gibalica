import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'meetup_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                      child: TextButton(
                          onPressed: () {
                            Get.to(const MeetupView());
                          },
                          child: const Text("Preskoci")),
                      height: (MediaQuery.of(context).size.height - statusBarHeight) * 0.1),
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - statusBarHeight) * 0.9,
              child: IntroductionScreen(
                done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
                onDone: () {
                  Get.to(const MeetupView());
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
                      title: "",
                      image: Image.asset('assets/images/Gibalica_running.png'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Aplikacija služi za",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "vježbanje i učenje",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      title: "",
                      image: Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Prednjom i stražnjom",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "kamerom možeš snimati",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "pokret tijela",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      title: "",
                      image: Padding(padding: EdgeInsets.symmetric(horizontal: 100), child: Image.asset('assets/images/Gibalica_cards.png')),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Umjesto vlastitim tijelom možeš",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "vježbati i s karticama",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      title: "",
                      image: Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Gibalica ti nudi 3 igre...",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      )),
                  PageViewModel(
                      titleWidget: const Text(
                        "TRENING",
                            textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                      image: Image.asset('assets/images/Gibalica_training.png'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "igra s vježbama za ruke i noge",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      titleWidget: const Text(
                        "DAN i NOĆ",
                            textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                      image: Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "zabavna igra koncentracije",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      titleWidget: const Text(
                        "PONAVLJANJE",
                            textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                      image: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100.0),
                        child: Image.asset('assets/images/Gibalica_repeating.png'),
                      ),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "igra pamćenja",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "redoslijeda vježbi",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                  PageViewModel(
                      title: "",
                      image: Image.asset('assets/images/onboarding9.png'),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Gibalica prati tvoj napredak ",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            "za svaku od igara",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
