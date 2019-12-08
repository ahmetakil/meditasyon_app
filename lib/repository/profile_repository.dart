import 'dart:convert';

import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/models/profileDatasModel.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ProfileRepository{
  static Future<ProfileModel> index() async {
    final url = BASE_URL + "profile_infos";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    final res =
    await http.post(url, headers: {'Authorization': 'Bearer $apiKey'});
    print(res.body);
    final data = jsonDecode(res.body);
    final dataModel = ProfileModel.fromJson(data);
    return dataModel;
  }

}