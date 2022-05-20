import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gibalica/views/profile_activation_view.dart';
import 'package:gibalica/views/screening_pages.dart';

import 'oboarding_view.dart';

class MeetupView extends StatelessWidget {
  const MeetupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(112, 173, 71, 1),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('assets/images/Gibalica_hello_white_circle.png'),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Sada kada znaš što te sve čeka, možemo krenuti",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    Get.to(const ScreeningPages());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white),
                    child: const Text(
                      'Upoznajmo se!',
                      style: TextStyle(fontSize: 35, color: Color.fromRGBO(36, 80, 128, 1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
