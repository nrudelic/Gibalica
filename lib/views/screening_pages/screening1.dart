import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/main.dart';

import '../../controllers/player_controller.dart';

class Screening1 extends StatefulWidget {
  const Screening1({Key? key}) : super(key: key);

  @override
  State<Screening1> createState() => _Screening1State();
}

class _Screening1State extends State<Screening1> {
  var playerController = Get.find<PlayerController>();
  var textController = TextEditingController();

  @override
  void initState() {
    textController.text = playerController.playerName??"";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: const Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
            child: AutoSizeText(
              "Molim te podijeli sa mnom nekoliko informacija kako bih te bolje upoznala",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: AutoSizeText(
              "Sve informacije koje mi sada podijeliš moći češ kasnije promijeniti u postavkama",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: AutoSizeText(
              "Kako se zoveš?",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: textController,
              onChanged: (text){
                playerController.playerName = text;
                settingsController.gibalicaBox.put("playerName", text);
              },
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
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
