
import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
    bool success;
    String message;
    List<Story> stories;
    List<TopLessonsWeekly> topLessonsWeekly;
    List<LastLesson> lastLessons;
    List<Tag> tags;
    List<BestAuthor> bestAuthors;

    HomePageModel({
        this.success,
        this.message,
        this.stories,
        this.topLessonsWeekly,
        this.lastLessons,
        this.tags,
        this.bestAuthors,
    });

    factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        success: json["success"],
        message: json["message"],
        stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        topLessonsWeekly: List<TopLessonsWeekly>.from(json["topLessonsWeekly"].map((x) => TopLessonsWeekly.fromJson(x))),
        lastLessons: List<LastLesson>.from(json["lastLessons"].map((x) => LastLesson.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        bestAuthors: List<BestAuthor>.from(json["bestAuthors"].map((x) => BestAuthor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
        "topLessonsWeekly": List<dynamic>.from(topLessonsWeekly.map((x) => x.toJson())),
        "lastLessons": List<dynamic>.from(lastLessons.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "bestAuthors": List<dynamic>.from(bestAuthors.map((x) => x.toJson())),
    };
}

class BestAuthor {
    int id;
    String name;
    String email;
    dynamic apiToken;
    dynamic description;
    dynamic profilePicture;
    String userType;
    dynamic emailVerifiedAt;
    String isApproved;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    BestAuthor({
        this.id,
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
    });

    factory BestAuthor.fromJson(Map<String, dynamic> json) => BestAuthor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        apiToken: json["api_token"],
        description: json["description"],
        profilePicture: json["profile_picture"],
        userType: json["user_type"],
        emailVerifiedAt: json["email_verified_at"],
        isApproved: json["is_approved"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "api_token": apiToken,
        "description": description,
        "profile_picture": profilePicture,
        "user_type": userType,
        "email_verified_at": emailVerifiedAt,
        "is_approved": isApproved,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class LastLesson {
    int id;
    String userId;
    String categoryId;
    String name;
    dynamic progress;
    String imageUrl;
    String isBackground;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    LastLesson({
        this.id,
        this.userId,
        this.categoryId,
        this.name,
        this.progress,
        this.imageUrl,
        this.isBackground,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory LastLesson.fromJson(Map<String, dynamic> json) => LastLesson(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        name: json["name"],
        progress: json["progress"],
        imageUrl: json["image_url"],
        isBackground: json["is_background"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "name": name,
        "progress": progress,
        "image_url": imageUrl,
        "is_background": isBackground,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
class TopLessonsWeekly {
    int id;
    String userId;
    String categoryId;
    String name;
    dynamic progress;
    String imageUrl;
    String isBackground;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    TopLessonsWeekly({
        this.id,
        this.userId,
        this.categoryId,
        this.name,
        this.progress,
        this.imageUrl,
        this.isBackground,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory TopLessonsWeekly.fromJson(Map<String, dynamic> json) => TopLessonsWeekly(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        name: json["name"],
        progress: json["progress"],
        imageUrl: json["image_url"],
        isBackground: json["is_background"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "name": name,
        "progress": progress,
        "image_url": imageUrl,
        "is_background": isBackground,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Story {
    int id;
    String userId;
    String url;
    String imageUrl;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Story({
        this.id,
        this.userId,
        this.url,
        this.imageUrl,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        userId: json["user_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "url": url,
        "image_url": imageUrl,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Tag {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Tag({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
