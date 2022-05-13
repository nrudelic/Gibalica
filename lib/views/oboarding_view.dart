import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'onboarding_pages/onboarding_page1.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: SizedBox(
                    child: TextButton(
                        onPressed: () {
                          Get.to(PoseDetectorView());
                        },
                        child: Text("Preskoci")),
                    height: MediaQuery.of(context).size.height * 0.1),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: IntroductionScreen(
              done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
              onDone: () {
                Get.to(PoseDetectorView());
              },
              onSkip: () {
                Get.to(PoseDetectorView());
              },
              showNextButton: true,
              showBackButton: true,
              next: Text("NESA"),
              skip: const Text("Skip"),
              back: const Text("back"),
              globalBackgroundColor: Colors.white,
              pages: [
                PageViewModel(
                  title: "Aplikacija služi za vježbanje i učenje",
                  body: "",
                  image: Image.asset('assets/images/onboarding1.png'),
                ),
                PageViewModel(
                  title: "Prednjom i stražnjom kamerom možeš snimati pokret tijela",
                  body: "",
                  image: Image.asset('assets/images/onboarding1.png'),
                ),
                PageViewModel(
                  title: "Umjesto vlastitim tijelom možeš vježbati i s karticama",
                  body: "",
                  image: Image.asset('assets/images/onboarding3.png'),
                ),
                PageViewModel(
                  title: "Gibalica ti nudi 3 igre...",
                  body: "",
                  image: Image.asset('assets/images/onboarding3.png'),
                ),
                PageViewModel(
                  title: "TRENING",
                  body: "igra s vježbama za ruke i noge",
                  image: Image.asset('assets/images/onboarding5.png'),
                ),
                PageViewModel(
                  title: "DAN i NOĆ",
                  body: "zabavna igra koncentracije",
                  image: Image.asset('assets/images/onboarding5.png'),
                ),
                PageViewModel(
                  body: "igra pamćenja redoslijeda vježbi",
                  title: "PONAVLJANJE",
                  image: Image.asset('assets/images/onboarding7.png'),
                ),
                PageViewModel(
                  body: "",
                  title: "Gibalica prati tvoj napredak za svaku od igara",
                  image: Image.asset('assets/images/onboarding7.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
