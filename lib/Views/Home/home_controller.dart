import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/Views/Home/home_model.dart';
import 'package:hexeam_test/services/services.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeModel? homeModel;
  var isLoading = true.obs;
  List bannerImages = [].obs;
  var city = "".obs;
  var country = "".obs;

  getProducts() async {
    isLoading.value = true;
    var data = await HttpServices.fetchProducts();
    if (data != null) {
      homeModel = data;
      isLoading.value = false;
      for (int i = 0; i < homeModel!.homeSliders.length; i++) {
        bannerImages.addAll([homeModel!.homeSliders[i].customerBanner]);
      }
    }
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      Get.snackbar("Location", "Permission denied");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        city.value = place.locality!;
        country.value = place.country!;
      }
    } catch (e) {}
  }

  @override
  void onInit() {
    getCurrentLocation();
    getProducts();
    super.onInit();
  }
}
