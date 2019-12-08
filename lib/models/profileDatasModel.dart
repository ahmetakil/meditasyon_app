import 'package:meditasyon_app/models/lesson_model.dart';

class ProfileModel {
  bool success;
  String message;
  User user;

  ProfileModel({this.success, this.message, this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  Null apiToken;
  Null description;
  String profilePicture;
  String userType;
  Null emailVerifiedAt;
  String isApproved;
  Null status;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  List<LessonModel> favoriteLessons;
  List<LessonModel> completedLessons;
  List<LessonModel> ownerLessons;
  int point;
  int ranking;

  User(
      {this.id,
        this.name,
        this.email,
        this.apiToken,
        this.description,
        this.profilePicture,
        this.userType,
        this.emailVerifiedAt,
        this.isApproved,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.favoriteLessons,
        this.completedLessons,
        this.ownerLessons,
        this.point,
        this.ranking});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    description = json['description'];
    profilePicture = json['profile_picture'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    isApproved = json['is_approved'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['favorite_lessons'] != null) {
      favoriteLessons = new List<LessonModel>();
      json['favorite_lessons'].forEach((v) {
        favoriteLessons.add(new LessonModel.fromJson(v));
      });
    }
    if (json['completed_lessons'] != null) {
      completedLessons = new List<LessonModel>();
      json['completed_lessons'].forEach((v) {
        completedLessons.add(new LessonModel.fromJson(v));
      });
    }
    if (json['owner_lessons'] != null) {
      ownerLessons = new List<LessonModel>();
      json['owner_lessons'].forEach((v) {
        ownerLessons.add(new LessonModel.fromJson(v));
      });
    }
    point = json['point'];
    ranking = json['ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['api_token'] = this.apiToken;
    data['description'] = this.description;
    data['profile_picture'] = this.profilePicture;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_approved'] = this.isApproved;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.favoriteLessons != null) {
      data['favorite_lessons'] =
          this.favoriteLessons.map((v) => v.toJson()).toList();
    }
    if (this.completedLessons != null) {
      data['completed_lessons'] =
          this.completedLessons.map((v) => v.toJson()).toList();
    }
    if (this.ownerLessons != null) {
      data['owner_lessons'] = this.ownerLessons.map((v) => v.toJson()).toList();
    }
    data['point'] = this.point;
    data['ranking'] = this.ranking;
    return data;
  }
}

