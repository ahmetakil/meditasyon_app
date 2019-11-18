// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    bool success;
    String message;
    List<Notification> notifications;

    NotificationModel({
        this.success,
        this.message,
        this.notifications,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        success: json["success"],
        message: json["message"],
        notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    };
}

class Notification {
    int id;
    String userId;
    String message;
    dynamic url;
    String isReaded;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Notification({
        this.id,
        this.userId,
        this.message,
        this.url,
        this.isReaded,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        userId: json["user_id"],
        message: json["message"],
        url: json["url"],
        isReaded: json["is_readed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "message": message,
        "url": url,
        "is_readed": isReaded,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
