import 'dart:convert';

import 'package:meditasyon_app/models/sounds_list_model.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SoundListRepository {
  static Future<SoundListModel> getSounds(lessonId) async {
    final url = BASE_URL + "soundsInLesson";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    final res = await http.post(url,
        headers: {'Authorization': 'Bearer $apiKey'},
        body: {'lesson_id': lessonId});
    print(res.body);
    final data = jsonDecode(res.body);
    final dataModel = SoundListModel.fromJson(data);
    return dataModel;
  }
}
