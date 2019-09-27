import 'package:flutter/material.dart';

import './meditasyon.dart';

class Lesson {
  final String name;
  final int progress;
  final String authorName;
  final NetworkImage image;
  final List<Meditasyon> content;

  Lesson({this.name, this.progress, this.authorName, this.image, this.content});
}
