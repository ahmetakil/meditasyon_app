import 'package:flutter/material.dart';

const BASE_URL = "http://meditation.improsyazilim.com/public/api/";

final PURPLE_GRADIENT = LinearGradient(
  colors: [
    Color(0xff892AE5),
    Color(0xff4100F3),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  tileMode: TileMode.clamp
);

final PURPLE_GRADIENT_VERTICAL = LinearGradient(
    colors: [
      Color(0xff892AE5),
      Color(0xff4100F3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp
);