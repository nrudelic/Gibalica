import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/main.dart';

import '../../controllers/player_controller.dart';

class Screening1 extends StatefulWidget {
  const Screening1({Key? key}) : super(key: key);

  @override
  State<Screening1> createState() => _Screening1State();
}

class _Screening1State extends State<Screening1> {
  var playerController = Get.find<PlayerController>();
  var settingsController = Get.find<SettingsController>();
  var textController = TextEditingController();

  @override
  void initState() {
    textController.text = playerController.playerName ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: AutoSizeText(
                    "MolimTePodijeliSaMnomNekolikoInformacijaKakoBihTeBoljeUpoznala".tr,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,),
                  ),
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  "SveInformacijeKojeMiSadaPodijelišMoćiČešKasnijePromijenitiUPostavkama".tr,
                  style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: AutoSizeText(
                    "KakoSeZoveš".tr,
                    style: TextStyle(fontSize: 35, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue,
                    background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  onChanged: (text) {
                    playerController.playerName = text;
                    settingsController.gibalicaBox.put("playerName", text);
                  },
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
