import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/game_controller.dart';
import 'package:gibalica/controllers/player_controller.dart';
import 'package:gibalica/models/pose_model.dart';
import 'package:gibalica/views/everything_ready_view.dart';
import 'package:gibalica/views/training_menu_pages/both_hands_training.dart';
import 'package:gibalica/views/training_menu_pages/both_legs_training.dart';
import 'package:gibalica/views/training_menu_pages/everything_training.dart';
import 'package:gibalica/views/training_menu_pages/left_hand_training.dart';
import 'package:gibalica/views/training_menu_pages/right_hand_training.dart';
import 'package:gibalica/views/training_menu_pages/single_leg_training.dart';
import 'package:gibalica/widgets/pose_detector_view.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    log("Gibalica : ${playerController.rightHandPref.value}");
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
              playerController.leftHandPref.value ? const LeftHandTraining() : Container(),
              playerController.leftHandPref.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    )
                  : Container(),
              playerController.rightHandPref.value ? const RightHandTraining() : Container(),
              playerController.rightHandPref.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    )
                  : Container(),
              (playerController.rightHandPref.value && playerController.leftHandPref.value) ? const BothHandsTraining() : Container(),
              (playerController.rightHandPref.value && playerController.leftHandPref.value)
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    )
                  : Container(),
              (playerController.leftLegPref.value || playerController.rightLegPref.value) ? const SingleLegTraining() : Container(),
              (playerController.leftLegPref.value || playerController.rightLegPref.value)
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    )
                  : Container(),
              (playerController.leftLegPref.value && playerController.rightLegPref.value) ? const BothLegsTraining() : Container(),
              (playerController.leftLegPref.value && playerController.rightLegPref.value)
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    )
                  : Container(),
              const EverythingTraining()
            ],
          ),
        ),
      ),
    );
  }
}
