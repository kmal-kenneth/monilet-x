import 'package:flutter/material.dart';
import 'package:monilet/ui/palette.dart';

class Constants {
  Constants._();

  static final labelStyle = TextStyle(
      fontSize: 11, color: Palette.grey[100], fontWeight: FontWeight.bold);
  static final valueStyle = TextStyle(
      fontSize: 11, color: Palette.grey[300], fontWeight: FontWeight.normal);

  static const labelRadarStyle = TextStyle(
      fontSize: 11, color: Palette.green, fontWeight: FontWeight.bold);
  static final valueRadarStyle = TextStyle(
      fontSize: 11, color: Palette.green[400], fontWeight: FontWeight.normal);
}
