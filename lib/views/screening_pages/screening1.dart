import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/player_controller.dart';

class Screening1 extends StatefulWidget {
  const Screening1({Key? key}) : super(key: key);

  @override
  State<Screening1> createState() => _Screening1State();
}

class _Screening1State extends State<Screening1> {
  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Text(
            "Molim te podijeli sa mnom nekoliko informacija kako bih te bolje upoznala",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            "Sve informacije koje mi sada podijeliš moći češ kasnije promijeniti u postavkama",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            "Kako se zoveš?",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            onChanged: (text){
              playerController.playerName = text;
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
      ],
    );
  }
}
