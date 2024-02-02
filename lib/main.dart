import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/Views/Bottom_navigation/bottom_navigation.dart';
import 'package:hexeam_test/Views/Home/home_screen.dart';
import 'package:hexeam_test/Views/Splash/splash_screen.dart';
import 'package:hexeam_test/utils/color_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Hexeam_test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Acme",
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorConstant.primaryColor),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
