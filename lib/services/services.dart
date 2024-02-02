import 'package:hexeam_test/Views/Home/home_model.dart';
import 'package:hexeam_test/const/const.dart';
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
      }
    } catch (e) {
      print(e);
    }
  }
}
