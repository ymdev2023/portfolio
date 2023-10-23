import 'package:appoment/controller/auth_controller.dart';
import 'package:appoment/controller/location_controller.dart';
import 'package:get/get.dart';

import 'kakaoController.dart';

void initializeController() {
  Get.put(LocationController());
  Get.put(AuthController());
  Get.put(KakaoController());

}