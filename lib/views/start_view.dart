import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'oboarding_view.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
              children: const [
                Text(
                  "GIBALICA",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "kaže bok!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/welcomeCharacter.png'),
            SizedBox(
              height: 100,
            ),
            Column(
              children: const [
                Text(
                  "Drago mi te vidjeti ovdje...",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  "Dobro došao(la)!",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
                onPressed: () {
                  Get.to(OnBoardingView());
                },
                child: Container(
                  width: width * 0.6,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                      child: const Text(
                    "Kreni",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  )),
                )),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
