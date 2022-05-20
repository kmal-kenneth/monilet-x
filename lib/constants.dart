import 'package:flutter/material.dart';
import 'package:monilet/ui/palette.dart';

class Constants {
  Constants._();

  static final labelStyle = TextStyle(
      fontSize: 11, color: Palette.grey[100], fontWeight: FontWeight.bold);
  static final valueStyle = TextStyle(
      fontSize: 11, color: Palette.grey[200], fontWeight: FontWeight.normal);

  static final labelRadarStyle = TextStyle(
      fontSize: 11, color: Palette.green[400], fontWeight: FontWeight.bold);
  static final valueRadarStyle = TextStyle(
      fontSize: 11, color: Palette.green[400], fontWeight: FontWeight.normal);
}
