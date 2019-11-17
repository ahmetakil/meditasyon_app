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
      final apiToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzBhOTg4ZmVjYmNmOWY1MDc5MzkzYTkwOTk5YjRkYzBiZWRjNzNjY2U0NWIzM2YxNGY5ODNiYzQ0ZmJjZGIzNjZlNjg4NDNjYWM5Y2ZkZTgiLCJpYXQiOjE1NzM5ODcxMTMsIm5iZiI6MTU3Mzk4NzExMywiZXhwIjoxNjA1NjA5NTEzLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.ejvFRu_DKC0aHKeomuFY3y0Zrsu8Li0ede878VtL7louyKL9srQce2t3AbE8tM_eenuSM0aT5br-cfUDUASshXReHrc6Yvc-jBewbqWc8vkHak7TtXup0oHSuzQTIMLZt4ph39A0YDnUpFxwIHYlZiUr72xyp2t0f6Ie9It9bheBpAJkakV8gR04PZTjgtjVtGGcJaRIon8jh86DMGn2P3kR3shqTey8x8ncbApFwnlgHH2fmRCiB-a16wb7vJPWcLv86qynUFEZkPS4g3b9IQMgIhp2SnFCqYK3-72TGTCEThMoendyP4vu-85m5T5PUclAVrSXkL1FQvYwVUp0un63-_hkU1CMClqc4QM5LLKcvMkUtfzfmrurR9pkBBjDNwd7IHQowvp9Uvg_zNihAM1hjXdBwygqTAltRVYqsZODJXGkYPR14fynahlmENfL7dohIzrF1ltbPPxZtJzRTRXFF4cLEYQZu_FYoETfMg5FEG3PNkDPLGogLhBoNrjHZwanChTw0zoQCH4naNV6ICjVDVML0g3RKpgGaenTSOsf9D99doS4Opel0RbatF--rf0RtW7IB-SC27VITft-66qkU1OadrUjQeSnEarZh7duhQ4UJEU7SuKrtbG6np1yntHqLfii3prL7zh3E0yis31iCOluMpUQtJ_pnrkw6kQ";
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
