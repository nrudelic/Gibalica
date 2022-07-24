import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gibalica/color_palette.dart';
import 'package:gibalica/controllers/settings_controller.dart';
import 'package:gibalica/views/main_screen_view.dart';
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
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  
                });
                Get.offAll(() => MainScreen());
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
          title: AutoSizeText(
            "Postavke".tr,
            style: TextStyle(color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.pink, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: AutoSizeText(
                    "IspisKartica".tr,
                    style: TextStyle(fontSize: 25, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: SvgPicture.asset("assets/cards.svg")),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              Uri _url = Uri.parse('https://ferhr-my.sharepoint.com/:b:/g/personal/nr50748_fer_hr/EY4DIPtAv0lHvGN-0V9uEnkBPAjq7spxO6fOzFxM-pWprA?e=XFyVsG');
                              if (!await launchUrl(_url)) throw "Could not launch $_url";
                            },
                            child: SvgPicture.asset("assets/share.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: AutoSizeText("OpcijePrilagodbi".tr, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: AutoSizeText("PromjenaIzgledaAplikacije".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            settingsController.isNormalContrast.value = true;
                            settingsController.gibalicaBox.put("isNormalContrast", true);
                            setState(() {});
                          },
                          child: Obx(
                            () => Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                ),
                                color: settingsController.isNormalContrast.isTrue ? ColorPalette.darkBlue : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              "Normalan kontrast".tr,
                              style: TextStyle(fontSize: 15, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            settingsController.isNormalContrast.value = false;
                            settingsController.gibalicaBox.put("isNormalContrast", false);
                            setState(() {});
                          },
                          child: Obx(
                            () => Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                ),
                                color: settingsController.isNormalContrast.isTrue ? Colors.white : ColorPalette.darkBlue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText("Povećan kontrast".tr, style: TextStyle(fontSize: 15, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // FittedBox(
                //   child: Padding(
                //     padding: EdgeInsets.only(bottom: 20.0),
                //     child: AutoSizeText("PromjenaVeličineTeksta".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                //   ),
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.15,
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Expanded(
                //           child: TextButton(
                //             onPressed: (() {
                //               settingsController.isBiggerText.value = false;
                //               settingsController.gibalicaBox.put("isBiggerText", false);
                //             }),
                //             style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                //             child: Obx(
                //               () => AutoSizeText(
                //                 "aA",
                //                 style: TextStyle(fontSize: 30, color: !settingsController.isBiggerText.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: !settingsController.isBiggerText.value ? FontWeight.bold : FontWeight.normal),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           child: TextButton(
                //               onPressed: (() {
                //                 settingsController.isBiggerText.value = true;
                //                 settingsController.gibalicaBox.put("isBiggerText", true);
                //               }),
                //               style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                //               child: Obx(
                //                 () => AutoSizeText(
                //                   "aA",
                //                   style: TextStyle(fontSize: 50, color: settingsController.isBiggerText.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: settingsController.isBiggerText.value ? FontWeight.bold : FontWeight.normal),
                //                 ),
                //               )),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: AutoSizeText("VrstaSlova".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: (() {
                              settingsController.isUppercase.value = true;
                              settingsController.gibalicaBox.put("uppercaseLetters", true);

                              if (settingsController.language.value == Language.Croatian) {
                                var locale = const Locale('HR', 'HR');
                                Get.updateLocale(locale);
                              } else {
                                var locale = const Locale('EN', 'US');
                                Get.updateLocale(locale);
                              }
                            }),
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                            child: Obx(
                              () => AutoSizeText(
                                "VelikaTiskana".tr,
                                style: TextStyle(fontSize: 15, color: settingsController.isUppercase.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: settingsController.isUppercase.value ? FontWeight.bold : FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: (() {
                                settingsController.isUppercase.value = false;
                                settingsController.gibalicaBox.put("uppercaseLetters", false);

                                if (settingsController.language.value == Language.Croatian) {
                                  var locale = const Locale('hr', 'HR');
                                  Get.updateLocale(locale);
                                } else {
                                  var locale = const Locale('en', 'US');
                                  Get.updateLocale(locale);
                                }
                              }),
                              style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white)),
                              child: Obx(
                                () => AutoSizeText(
                                  "VelikaIMalaTiskana".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, color: !settingsController.isUppercase.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: !settingsController.isUppercase.value ? FontWeight.bold : FontWeight.normal),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: AutoSizeText("Zvuk".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              settingsController.isSoundOn.value = true;
                              settingsController.gibalicaBox.put("isSoundOn", true);
                            },
                            child: Row(
                              children: [
                                Expanded(child: SvgPicture.asset("assets/sound_ON.svg")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => AutoSizeText("UpaliZvuk".tr, style: TextStyle(fontSize: 15, color: settingsController.isSoundOn.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: settingsController.isSoundOn.value ? FontWeight.bold : FontWeight.normal)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              settingsController.isSoundOn.value = false;
                              settingsController.gibalicaBox.put("isSoundOn", false);
                            },
                            child: Row(
                              children: [
                                Expanded(child: SvgPicture.asset("assets/sound_OFF.svg")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => AutoSizeText(
                                      "UgasiZvuk".tr,
                                      style: TextStyle(fontSize: 15, color: !settingsController.isSoundOn.value ? ColorPalette.darkBlue : Colors.grey, fontWeight: !settingsController.isSoundOn.value ? FontWeight.bold : FontWeight.normal),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: AutoSizeText("PromjenaJezika".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              settingsController.language.value = Language.Croatian;
                              settingsController.gibalicaBox.put("language", "Croatian");

                              if (settingsController.language.value == Language.Croatian && settingsController.isUppercase.value) {
                                var locale = const Locale('HR', 'HR');
                                Get.updateLocale(locale);
                              } else if (settingsController.language.value == Language.Croatian && !settingsController.isUppercase.value) {
                                var locale = const Locale('hr', 'HR');
                                Get.updateLocale(locale);
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(child: Image.asset("assets/croatian_flag.jpg")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => AutoSizeText(
                                      "Hrvatski".tr,
                                      style: TextStyle(fontSize: 15, color: settingsController.language.value == Language.Croatian ? ColorPalette.darkBlue : Colors.grey, fontWeight: settingsController.language.value == Language.Croatian ? FontWeight.bold : FontWeight.normal),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              settingsController.language.value = Language.English;
                              settingsController.gibalicaBox.put("language", "English");

                              if (settingsController.language.value == Language.English && settingsController.isUppercase.value) {
                                var locale = const Locale('EN', 'US');
                                Get.updateLocale(locale);
                              } else if (settingsController.language.value == Language.English && !settingsController.isUppercase.value) {
                                var locale = const Locale('en', 'US');
                                Get.updateLocale(locale);
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(child: Image.asset("assets/english_flag.jpg")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => AutoSizeText("Engleski".tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: settingsController.language.value == Language.English ? ColorPalette.darkBlue : Colors.grey,
                                          fontWeight: settingsController.language.value == Language.English ? FontWeight.bold : FontWeight.normal,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: AutoSizeText("InformacijeOAplikaciji".tr, style: TextStyle(fontSize: 20, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: AutoSizeText("PonovnoUpoznajAplikaciju".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: settingsController.isNormalContrast.isFalse ? Colors.yellow : ColorPalette.darkBlue, background: Paint()..color = settingsController.isNormalContrast.isFalse ? Colors.black : Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => OnboardingPages(1),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorPalette.green),
                              child: Center(
                                  child: Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.1,
                              )),
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
