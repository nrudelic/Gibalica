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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/Gibalica_hello_white_circle.png'),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  Get.to(const OnBoardingView());
                },
                child: Container(
                  width: width * 0.6,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(const Radius.circular(50))),
                  child: const Center(
                      child: Text(
                    "Kreni",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  )),
                )),
          ),
        ],
      ),
    );
  }
}
