import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/views/onboarding_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.darkBlue),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: FittedBox(
                    child: Icon(Icons.navigate_before),
                  ),
                ),
              ),
            ),
          ),
          title: const Text(
            "Postavke",
            style: TextStyle(color: ColorPalette.pink, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.9,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    "Ispis kartica",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/cards.svg"),
                      GestureDetector(
                        onTap: () async {
                          Uri _url = Uri.parse('https://ferhr-my.sharepoint.com/:u:/g/personal/nr50748_fer_hr/ET8cUdjiAxdAjwzX3O45oUkBI2TEODQqzZzjCybuAzyhFw?e=ZYr92g');
                          if (!await launchUrl(_url)) throw "Could not launch $_url";
                        },
                        child: SvgPicture.asset("assets/share.svg"),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text("Promjena izgleda aplikacije", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue)),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text("Promjena izgleda aplikacije", style: TextStyle(fontSize: 20, color: ColorPalette.darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          settingsController.isLightMode.value = false;
                          settingsController.gibalicaBox.put("isLightMode", false);
                        },
                        child: Obx(
                          () => Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              color: settingsController.isLightMode.isTrue ? Colors.white : ColorPalette.darkBlue,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Tamni način",
                        style: TextStyle(fontSize: 15, color: ColorPalette.darkBlue),
                      ),
                      GestureDetector(
                        onTap: () {
                          settingsController.isLightMode.value = true;
                          settingsController.gibalicaBox.put("isLightMode", true);
                        },
                        child: Obx(
                          () => Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              color: settingsController.isLightMode.isTrue ? ColorPalette.darkBlue : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const Text("Svijetli način", style: TextStyle(fontSize: 15, color: ColorPalette.darkBlue))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text("Promjena veličine teksta", style: TextStyle(fontSize: 20, color: ColorPalette.darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (() {
                          settingsController.isBiggerText.value = false;
                          settingsController.gibalicaBox.put("isBiggerText", false);
                        }),
                        child: Obx(
                          () => Text(
                            "aA",
                            style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: !settingsController.isBiggerText.value ? FontWeight.bold : FontWeight.normal),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: (() {
                            settingsController.isBiggerText.value = true;
                            settingsController.gibalicaBox.put("isBiggerText", true);
                          }),
                          child: Obx(
                            () => Text(
                              "aA",
                              style: TextStyle(fontSize: 50, color: ColorPalette.darkBlue, fontWeight: settingsController.isBiggerText.value ? FontWeight.bold : FontWeight.normal),
                            ),
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text("Zvuk", style: TextStyle(fontSize: 20, color: ColorPalette.darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          settingsController.isSoundOn.value = true;
                          settingsController.gibalicaBox.put("isSoundOn", true);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/sound_ON.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Text("Upali zvuk", style: TextStyle(fontSize: 15, color: ColorPalette.darkBlue, fontWeight: settingsController.isSoundOn.value ? FontWeight.bold : FontWeight.normal)),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          settingsController.isSoundOn.value = false;
                          settingsController.gibalicaBox.put("isSoundOn", false);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/sound_OFF.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Text(
                                "Ugasi zvuk",
                                style: TextStyle(fontSize: 15, color: ColorPalette.darkBlue, fontWeight: !settingsController.isSoundOn.value ? FontWeight.bold : FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text("Promjena jezika", style: TextStyle(fontSize: 20, color: ColorPalette.darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          settingsController.language.value = Language.Croatian;
                          settingsController.gibalicaBox.put("language", "Croatian");
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/croatian_flag.jpg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Text(
                                "Hrvatski",
                                style: TextStyle(fontSize: 15, color: ColorPalette.darkBlue, fontWeight: settingsController.language.value == Language.Croatian ? FontWeight.bold : FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          settingsController.language.value = Language.English;
                          settingsController.gibalicaBox.put("language", "English");
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/english_flag.jpg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Text("Engleski",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorPalette.darkBlue,
                                    fontWeight: settingsController.language.value == Language.English ? FontWeight.bold : FontWeight.normal,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text("Informacije o aplikaciji", style: TextStyle(fontSize: 20, color: ColorPalette.darkBlue)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AutoSizeText("Ponovno upoznaj aplikaciju", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorPalette.darkBlue)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => OnboardingPages(1));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.green),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Center(
                              child: AutoSizeText(
                                ">",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
