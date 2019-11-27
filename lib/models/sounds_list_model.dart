class SoundListModel {
  bool success;
  String message;
  List<Sounds> sounds;

  SoundListModel({this.success, this.message, this.sounds});

  SoundListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['sounds'] != null) {
      sounds = new List<Sounds>();
      json['sounds'].forEach((v) {
        sounds.add(new Sounds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.sounds != null) {
      data['sounds'] = this.sounds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sounds {
  int id;
  String userId;
  String lessonId;
  String name;
  String url;
  String duration;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  Sounds(
      {this.id,
      this.userId,
      this.lessonId,
      this.name,
      this.url,
      this.duration,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Sounds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lessonId = json['lesson_id'];
    name = json['name'];
    url = json['url'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['lesson_id'] = this.lessonId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}