import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/views/screening_pages/screening1.dart';
import 'package:gibalica/views/screening_pages/screening2.dart';
import 'package:gibalica/views/screening_pages/screening3.dart';
import 'package:gibalica/views/screening_pages/screening4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../color_palette.dart';
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
  int currentPage = 0;

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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            color: Colors.white,
            height: height * 0.85,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                currentPage = index;
                setState(() {
                  log(playerController.exerciseProgram.value.toString());
                  if (playerController.exerciseProgram.value == ExerciseProgram.all && index == 2) {
                    isLastPage = true;
                  } else if (playerController.exerciseProgram.value == ExerciseProgram.special && index == 3) {
                    isLastPage = true;
                  } else {
                    isLastPage = false;
                  }
                });
              },
              controller: controller,
              children: [
                const Screening1(),
                const Screening2(),
                Screening3(),
                Screening4(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: height * 0.15,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                if (controller.page == 0) {
                  Get.back();
                } else {
                  controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                }
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(36, 80, 128, 1)),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.navigate_before,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
              ),
            ),
            GestureDetector(
              onTap: () {
                if ((playerController.playerName == null || playerController.playerName!.isEmpty)) return;
                log(isLastPage.toString());

                if (playerController.exerciseProgram.value == ExerciseProgram.all && currentPage == 2) {
                  if (playerController.playerName != null && playerController.playerName != "Ime igrača" && playerController.playerName!.isNotEmpty && (playerController.leftHandPref.value || playerController.rightHandPref.value || playerController.squatPref.value || playerController.leftLegPref.value || playerController.rightLegPref.value)) {
                    Get.off(() => EverythingReady());
                  } else {
                    showAlertDialog(context);
                  }
                } else if (playerController.exerciseProgram.value == ExerciseProgram.special && currentPage == 3) {
                  if (playerController.playerName != null && playerController.playerName != "Ime igrača" && playerController.playerName!.isNotEmpty && (playerController.leftHandPref.value || playerController.rightHandPref.value || playerController.squatPref.value || playerController.leftLegPref.value || playerController.rightLegPref.value)) {
                    Get.off(() => EverythingReady());
                  } else {
                    showAlertDialog(context);
                  }
                } else {
                  controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                }
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(112, 173, 71, 1)),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.1,
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
      child: const Text(
        "OK",
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Oooops".tr,
        style: TextStyle(fontSize: 15),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "KakoBiNastaviolaDaljePotrebnoJeZadovoljitiSljedećeUvjete".tr,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "UpisatiSvojeIme".tr,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "OdabratiAvatar".tr,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "OdabratiBaremJednuVježbu".tr,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
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
