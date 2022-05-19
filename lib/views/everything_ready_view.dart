import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'oboarding_view.dart';

class EverythingReady extends StatelessWidget {
  const EverythingReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 192, 0, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.2,
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
                    "Super, sada je sve spremno!",
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
                    width: width * 0.45,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(50),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Gibaj se!",
                      style: TextStyle(fontSize: 35, color: Color.fromRGBO(36, 80, 128, 1)),
                    )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
