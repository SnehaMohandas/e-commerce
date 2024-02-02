import 'package:get/get.dart';
import 'package:hexeam_test/Views/Home/home_model.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  static Future fetchProducts() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://hexprojects.in/ImperialCustomer/api/customer/get-home-contents?branch_id=1"),
      );
      if (response.statusCode == 200) {
        return homeModelFromJson(response.body);
      } else {
        Get.snackbar("Error occur", "falied to load the data");
      }
    } catch (e) {
      print(e);
    }
  }
}
