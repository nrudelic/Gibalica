import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/views/screening_pages.dart';

class MeetupView extends StatelessWidget {
  MeetupView({Key? key}) : super(key: key);
  var settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {

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
                  child: SvgPicture.asset('assets/Gibalica_hello_white_circle.svg'),
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
                    Get.to(() => const ScreeningPages());
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
