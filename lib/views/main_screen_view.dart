import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/views/training_view.dart';

import '../controllers/player_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  var playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return CircleAvatar(
                          child: SvgPicture.asset(
                            playerController.avatarAssetPath!,
                          ),
                          minRadius: constraint.biggest.height,
                        );
                      }),
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Icon(Icons.settings_outlined, size: constraint.biggest.height);
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const TrainingView());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.yellow),
                        child: const Text(
                          'TRENING',
                          style: TextStyle(fontSize: 40, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.pink),
                        child: const Text(
                          'DAN I NOĆ',
                          style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: ColorPalette.lightBlue),
                        child: const Text(
                          'PONAVLJANJE',
                          style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
