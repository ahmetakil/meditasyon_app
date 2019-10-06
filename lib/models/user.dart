import 'package:flutter/material.dart';

import './lesson.dart';

enum UserType{USER,AUTHOR}

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
}
