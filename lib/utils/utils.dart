import 'package:flutter/material.dart';

const BASE_URL = "http://meditationv1.improsyazilim.com/public/api/";
const BASE_MEDIA_URL = "http://meditationv1.improsyazilim.com/public/uploads/upload_sounds/";
const IMAGE_BASE_URL = "http://meditationv1.improsyazilim.com/public/uploads/upload_user_profiles/";

final PURPLE_GRADIENT = LinearGradient(
    colors: [
      Color(0xff892AE5),
      Color(0xff4100F3),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.clamp);

final PURPLE_GRADIENT_VERTICAL = LinearGradient(
    colors: [
      Color(0xff892AE5),
      Color(0xff4100F3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp);

String printDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  String output =
      "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";

  if (duration.inHours < 1) {
    return output.substring(3);
  }
  return output;
}
