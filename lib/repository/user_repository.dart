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
      // final apiToken =
      //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjQyODVlYTBkNzhjNjNlNTc2MDNiOWFhYWU5NmM2YjcxZjBlNTI0Zjk1YmNlYzU1NmRmZmMyNDE5YjhlMjM4MWU1Y2U3MjRiMWQ4ZTA0ODEiLCJpYXQiOjE1NzU3NDcwNTQsIm5iZiI6MTU3NTc0NzA1NCwiZXhwIjoxNjA3MzY5NDU0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.mi5w2sW8bCaVVr5mxjBukx6oaQHBJyH7evqXnghYF42nNFfnJsaY9yjepuE75Ax_23nvFRIjAv6FtIinRdphsrMle7Ann_gw-BvmwPRveXI280VlBDTKpbgGnIPgUe7aRKQCFW0vJplPwvBFdyHhjnBi6xUfrqVg_viG8JkmTN41VRs-h0aqhio9M5kzyIkbHnPb2I1baMXuyFbQXAontQunMV7L4ki37UuVsBTNIEK-f2cLbytm5GBLErBHluwEYKZ43fkhCHrCFkvhEeOocwo7RxO88kj6yI36SF1NfsHcEOCW9gfeLXzr7WGsWYkt5J0Q1GC2u5mt3DOhQ_HbZWPuUvZZP-op8TMA-K-mXMFV4Bk3gmboZ8DVpfaQ1DaDLvoSOD8sUm0axR_n0YoWbLvWeO9nHlLx1QqW_dTAsBh8wvk_Q56t6pISW-8CkxQTQ5TVzvM3nuzE8u2bJk4zX-bxIC9u50S-bwdQsayI9_38qT8tHulNOUtsDqamWd0oaWmvFt_VVZHZDFN8a2rx1JXva23O-3MOIXJcwvvdNoNeuFpsZSHyXfZ5d2Ertn7ZxXhrAr1yyAvu-ooe0USEnlM1J1YcxBjmdkeZF3Zq7Hv1wXQit0KLE0kyx3doMPhe0qQHjQmkjES2dpRQstmCdMFFNSzx8rw81cs_xX-7OUE";
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

    try {
      final data = jsonDecode(res.body);
      print("API RESPONSE : $data");
      print("CURRENT TOKEN: $apiKey");
      sp.setString("token", null);
      return data["success"];
    } catch (e, s) {
      print('Exception occured: ${e.toString()}');
      print(s);
      return false;
    }
  }
}
