import 'package:get/get.dart';

class DeviceController extends GetxController {
  late DeviceType deviceType;
  late double width;
  late double height;
}

enum DeviceType{
  phone,
  tablet
}