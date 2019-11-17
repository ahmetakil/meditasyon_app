import 'package:flutter/material.dart';

import './lesson.dart';

enum UserType { USER, AUTHOR }

class User {
  final String id;
  final String name;
  final String email;
  final List<Lesson> favorites;
  final Map<Lesson, double> inProgress;
  final String imageUrl;
  final List<Lesson> finished;
  final int score;

  User(
      {@required this.id,
      @required this.name,
      @required this.email,
      this.favorites,
      this.inProgress,
      @required this.imageUrl,
      this.finished,
      this.score});

  var x =
      "[{\"id\":\"1\",\"name\":\"test\",\"totalDuration\":\"11\",\"url\":\"kkk\",\"user_id\":\"1\",\"is_active\":\"1\",\"created_at\":\"2019-10-12 15:09:14\",\"updated_at\":\"2019-10-12 15:09:14\"},{\"id\":\"1\",\"name\":\"test\",\"totalDuration\":\"11\",\"url\":\"kkk\",\"user_id\":\"1\",\"is_active\":\"1\",\"created_at\":\"2019-10-12 15:09:14\",\"updated_at\":\"2019-10-12 15:09:14\"},{\"id\":\"2\",\"name\":\"test\",\"totalDuration\":\"11\",\"url\":\"kkk\",\"user_id\":\"1\",\"is_active\":\"1\",\"created_at\":\"2019-10-12 15:09:16\",\"updated_at\":\"2019-10-12 15:09:16\"},{\"id\":\"2\",\"name\":\"test\",\"totalDuration\":\"11\",\"url\":\"kkk\",\"user_id\":\"1\",\"is_active\":\"1\",\"created_at\":\"2019-10-12 15:09:16\",\"updated_at\":\"2019-10-12 15:09:16\"}]";
}
