import './meditasyon.dart';

class Lesson {
  final String name;
  final int progress;
  final String authorName;
  final String imageUrl;
  final List<Meditasyon> content;

  Lesson({this.name, this.progress, this.authorName, this.imageUrl, this.content});
}
