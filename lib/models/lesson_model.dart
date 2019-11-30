class LessonModel {
  dynamic id;
  String userId;
  String categoryId;
  String name;
  dynamic progress;
  String imageUrl;
  String isBackground;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  LessonModel(
      {this.id,
      this.userId,
      this.categoryId,
      this.name,
      this.progress,
      this.imageUrl,
      this.isBackground,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    name = json['name'];
    progress = json['progress'];
    imageUrl = json['image_url'];
    isBackground = json['is_background'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['progress'] = this.progress;
    data['image_url'] = this.imageUrl;
    data['is_background'] = this.isBackground;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}