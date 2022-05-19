import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/views/profile_activation_view.dart';

import 'oboarding_view.dart';

class MeetupView extends StatelessWidget {
  const MeetupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(112, 173, 71, 1),
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
                    "Sada kada znaš što te sve",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "čeka, možemo krenuti",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: () {
                    Get.to(const ProfileActivationView());
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
                      "Upoznajmo se!",
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
