import 'dart:convert';

import 'package:meditasyon_app/models/notification.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationRepository {
  static Future<NotificationModel> index() async {
    final url = BASE_URL + "notifications";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    final res =
        await http.post(url, headers: {'Authorization': 'Bearer $apiKey'});
    print(res.body);
    final data = jsonDecode(res.body);
    final dataModel = NotificationModel.fromJson(data);
    return dataModel;
  }

  static Future deleteNotifications(String notificationId) async {
    final url = BASE_URL + "read_notifications";
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    final res =
        await http.post(url, headers: {'Authorization': 'Bearer $apiKey'},body: {
          'notification_id':notificationId
        });
    print(res.body);
    final data = jsonDecode(res.body);
    return data;
  }
}
