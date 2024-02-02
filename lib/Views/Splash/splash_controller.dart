import 'package:get/get.dart';
import 'package:hexeam_test/Views/Bottom_navigation/bottom_navigation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  splashOn() async {
    Future.delayed(
      const Duration(seconds: 2),
    );
    Get.to(() => BottomNavigation());
  }

  @override
  void onInit() {
    splashOn();
    super.onInit();
  }
}
