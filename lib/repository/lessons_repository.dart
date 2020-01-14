import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meditasyon_app/models/lessons_from_tag_model.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonsRepository {
  static Future<LessonModelTag> getLessonsFromTag(tagId) async {
    final url = BASE_URL + "lessonsWithTags";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    final res = await http.post(url,
        headers: {'Authorization': 'Bearer $apiKey'}, body: {'tag_id': tagId});
    print(res.body);
    final data = jsonDecode(res.body);
    final dataModel = LessonModelTag.fromJson(data);
    return dataModel;
  }
}
