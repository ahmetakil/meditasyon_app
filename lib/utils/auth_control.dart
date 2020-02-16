import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth {
  static Future<bool> isLogged() async { // TODO auth requesti ile desteklenecek
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    return apiKey != null ? true : false;
  }
}
