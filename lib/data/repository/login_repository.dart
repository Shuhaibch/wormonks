import 'dart:convert';

import 'package:get/get.dart';
import 'package:wormonks/features/authentication/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends GetxController {
  static LoginRepository get instance => Get.find();

  //* Login User
  Future loginUser(String username, String password) async {
    try {
      final userDetails = {
        "username": username,
        "password": password,
        "token":
            "cGTk0CXeR767zr5VuUe4Pa:APA91bEme2KwmSlsfzyDvT1dz1YJcBSNofzpyuRuWhrQ-9X_wlgnWrRedH9GcUvggANbzVZ_38wrPDGejl-ujo5Wwgx8PQupb0_LPnlsjDIrxYZIeLlL7iwncqgPNwjBXMwi0MQ2ytji"
      };
      var responce = await http.post(
          Uri.parse('https://suncity.warmonks.com/api/login'),
          body: userDetails);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final UserModel user = UserModel.fromJson(jsonDecode(responce.body));
        // print(user.message);
        return {"status": true, "data": user};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": false, "data": 'Error Occured'};
    }
  }
}
