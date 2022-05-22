import 'package:flutter/material.dart';
import 'package:gibalica/color_palette.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: const Center(
                child: Text(
                  "TRENING",
                  style: TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: const [
TrainingCategoryView(title: "LIJEVA RUKA"),
TrainingCategoryView(title: "DESNA RUKA"),
TrainingCategoryView(title: "LIJEVA NOGA"),
TrainingCategoryView(title: "DESNA NOGA"),
              ],
            ))));
  }
}

class TrainingCategoryView extends StatelessWidget {
  const TrainingCategoryView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(onTap: () {}, child: Image.asset("assets/images/Hand_Right.png")),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title.split(" ")[0],
                    style: const TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    title.split(" ")[1],
                    style: const TextStyle(fontSize: 30, color: ColorPalette.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: LayoutBuilder(builder: (context, constraint) {
                  return CircleAvatar(
                    child: Image.asset(
                      "assets/images/Avatar_1_Girl1.png",
                    ),
                    minRadius: constraint.biggest.height,
                  );
                }),
              ),
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: LayoutBuilder(builder: (context, constraint) {
                      return CircleAvatar(
                        child: Image.asset(
                          "assets/images/Avatar_1_Girl1.png",
                        ),
                        minRadius: constraint.biggest.height,
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: LayoutBuilder(builder: (context, constraint) {
                      return CircleAvatar(
                        child: Image.asset(
                          "assets/images/Avatar_1_Girl1.png",
                        ),
                        minRadius: constraint.biggest.height,
                      );
                    }),
                  ),
                ),
              ],
            ))
          ]),
        )
      ]),
    );
  }
}
