import 'package:meditasyon_app/models/lesson_model.dart';

class LessonModelTag {
  bool success;
  String message;
  List<LessonModel> lessons;

  LessonModelTag({this.success, this.message, this.lessons});

  LessonModelTag.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['lessons'] != null) {
      lessons = new List<LessonModel>();
      json['lessons'].forEach((v) {
        lessons.add(new LessonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
