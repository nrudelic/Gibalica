import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/views/onboarding_pages/onboarding1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'meetup_view.dart';
import 'onboarding_pages/onboarding2.dart';
import 'onboarding_pages/onboarding3.dart';
import 'onboarding_pages/onboarding4.dart';
import 'onboarding_pages/onboarding5.dart';
import 'onboarding_pages/onboarding6.dart';
import 'onboarding_pages/onboarding7.dart';
import 'onboarding_pages/onboarding8.dart';

class OnboardingPages extends StatefulWidget {
  int i;
  OnboardingPages(this.i, {Key? key}) : super(key: key);

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                widget.i == 0 ? Get.to(()=> MeetupView()) : Get.back();
              },
              child: const Text("PRESKOČI"),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          height: height * 0.85,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 7;
              });
            },
            controller: controller,
            children: const [
              Onboarding1(),
              Onboarding2(),
              Onboarding3(),
              Onboarding4(),
              Onboarding5(),
              Onboarding6(),
              Onboarding7(),
              Onboarding8(),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          height: height * 0.15,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () => controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(36, 80, 128, 1)),
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "<",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 8,
              ),
            ),
            GestureDetector(
              onTap: () {
                isLastPage ? (widget.i == 0 ? Get.to(() => MeetupView()) : Get.back()) : controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(112, 173, 71, 1)),
                padding: const EdgeInsets.all(20),
                child: const Text(
                  ">",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
