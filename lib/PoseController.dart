// ignore: file_names
import 'package:get/get.dart';

class PoseController extends GetxController {
  final currentPose = 'Poza nije prepoznata'.obs;

  updateCurrentPose(String pose) {
    currentPose(pose);
  }
}
