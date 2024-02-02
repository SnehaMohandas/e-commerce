import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/Views/Bottom_navigation/bottom_navigation.dart';
import 'package:hexeam_test/Views/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // final NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() =>
          BottomNavigation()); // Use Get.off() to prevent going back to the splash screen
    });
    //final splashController = Get.put(SplashController());
    return
        // Obx(() {
        //   if (networkController.isConnected.value) {
        //      final SplashController splashController = Get.put(SplashController());
        //  return
        Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 130,
              width: 130,
              //child: Text("splsh"),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/app_logo.png"),
                      fit: BoxFit.cover)),
            ),
          )
        ],
      ),
    );
    // } else {
    //   return networkController.noDataImage(context);
    // }
    //}
    //);
  }
}
