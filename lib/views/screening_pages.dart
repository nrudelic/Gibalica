import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/views/screening_pages/screening1.dart';
import 'package:gibalica/views/screening_pages/screening2.dart';
import 'package:gibalica/views/screening_pages/screening3.dart';
import 'package:gibalica/views/screening_pages/screening4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'everything_ready_view.dart';

class ScreeningPages extends StatefulWidget {
  const ScreeningPages({Key? key}) : super(key: key);

  @override
  State<ScreeningPages> createState() => _ScreeningPagesState();
}

class _ScreeningPagesState extends State<ScreeningPages> {
  final controller = PageController();
  var playerController = Get.find<PlayerController>();
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
        body: Container(
          color: Colors.white,
          height: height * 0.85,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            controller: controller,
            children: [
              const Screening1(),
              const Screening2(),
              Screening4(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
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
                count: 3,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isLastPage) {
                  if (playerController.playerName != null && playerController.playerName != "Ime igrača" && playerController.playerName!.isNotEmpty && playerController.avatarChosen && (playerController.leftHandPref.value || playerController.rightHandPref.value || playerController.squatPref.value || playerController.leftLegPref.value || playerController.rightLegPref.value)) {
                    Get.to(() => EverythingReady());
                  } else {
                    showAlertDialog(context);
                  }
                } else {
                  controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                }
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Oooops... :("),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Kako bi nastavio/la dalje potrebno je zadovoljiti sljedeće uvjete:"),
          Text(" - upisati svoje ime"),
          Text(" - odabrati avatar"),
          Text(" - odabrati barem jednu vježbu"),
        ],
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
