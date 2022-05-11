import 'package:flutter/material.dart';
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
                child: SizedBox(child: TextButton(onPressed: () {}, child: Text("Preskoci")), height: MediaQuery.of(context).size.height * 0.1),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: IntroductionScreen(
              done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
              onDone: () {},
              onSkip: () {},
              showNextButton: true,
              showBackButton: true,
              next: Text("NESA"),
              skip: const Text("Skip"),
              back: const Text("back"),
              globalBackgroundColor: Colors.white,
              pages: [
                PageViewModel(
                  body: "Aplikacija služi za vježbanje i učenje",
                  title: "AEHAIWUE",
                  image: Image.asset('assets/images/onboarding1.png'),
                ),
                PageViewModel(title: "", bodyWidget: OnboardingPage1()),
                PageViewModel(title: "", bodyWidget: OnboardingPage1()),
                PageViewModel(title: "", bodyWidget: OnboardingPage1()),
                PageViewModel(title: "", bodyWidget: OnboardingPage1()),
                PageViewModel(title: "", bodyWidget: OnboardingPage1()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
