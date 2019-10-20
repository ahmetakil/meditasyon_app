import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/lesson.dart';
import '../models/login.dart' show UserLogin;
import '../models/register.dart' show Register;
import '../models/user.dart' show User;
import '../utils/utils.dart';

class UserRepository {
  static Lesson getLastLesson(User user) {
    return user.inProgress.keys.toList()[0];
  }

  static Future<Register> register(
      String email, String username, String password) async {
    final url = BASE_URL + "register";

    final response = await http.post(url, body: {
      'name': username,
      'email': email,
      'password': password,
    });

    final responseData = jsonDecode(response.body);

    print(responseData);

    if (responseData["success"]) {
      // Create new user
      return Register.fromJson(responseData);
    } else {
      // Show snackbar with error message
      return Register(
          success: false, message: responseData["message"], authInit: false);
    }
  }

  static Future<UserLogin> login(String email, String password) async {
    final url = BASE_URL + "login";

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    final responseData = jsonDecode(response.body);

    if (responseData["success"]) {
      final userLogin = UserLogin.fromJson(responseData);
      final apiToken = userLogin.user.apiToken;
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString("token", apiToken);
      return userLogin;
    } else {
      final userLogin = UserLogin(
          success: false, message: responseData["message"], user: null);

      return userLogin;
    }
  }

  static Future<bool> testAuth() async {
    print("AB");
    final url = BASE_URL + "testAuth";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");

    final res =
        await http.post(url, headers: {'Authorization': 'Bearer $apiKey'});

    final data = jsonDecode(res.body);

    print(data);
    return data["success"];
  }

  static Future<bool> logout() async {
    final url = BASE_URL + "logout";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token") ?? "";

    final res =
        await http.post(url, headers: {'Authorization': 'Bearer $apiKey'});

    final data = jsonDecode(res.body);

    print("API RESPONSE : $data");
    print("CURRENT TOKEN: $apiKey");

    sp.setString("token", null);

    return data["success"];
  }
}
