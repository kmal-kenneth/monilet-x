import 'package:flutter/material.dart';

class Palette {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Palette._();

  static const Color background = Color.fromRGBO(40, 44, 52, .8);
  static const SweepGradient baseGradient = SweepGradient(
      colors: <Color>[Color(0xFF7692FF), Color(0xFF35CE8D)],
      stops: <double>[0.0, 1]);
  static const LinearGradient linearBaseGradient = LinearGradient(
      colors: <Color>[Color(0xFF7692FF), Color(0xFF35CE8D)],
      stops: <double>[0.0, 1],
      transform: GradientRotation(4.71));

// define grey colors
  static const int _greyPrimaryValue = 0x00fdfdff;
  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      100: Color.fromRGBO(253, 253, 255, 1),
      200: Color.fromRGBO(227, 227, 230, 1),
      300: Color.fromRGBO(200, 201, 205, 1),
      400: Color.fromRGBO(174, 175, 180, 1),
      500: Color.fromRGBO(147, 149, 154, 1),
      600: Color.fromRGBO(121, 123, 129, 1),
      700: Color.fromRGBO(94, 97, 103, 1),
      800: Color.fromRGBO(67, 71, 78, 1),
      900: Color.fromRGBO(40, 44, 52, 1),
      1000: Color.fromRGBO(36, 40, 47, 1),
    },
  );

  // define green colors
  static const int _greenPrimaryValue = 0xFF35CE8D;
  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      100: Color(0xffE4F8F1),
      200: Color(0xffcbf2e3),
      300: Color(0xff99e6c6),
      400: Color(0xff67daaa),
      500: Color(0xFF35CE8D),
      600: Color(0xff31a576),
      700: Color(0xff2d7b5e),
      800: Color(0xff295247),
      900: Color(0xff273d3b),
      1000: Color(0xff233736),
    },
  );

  // define blue colors
  static const int _bluePrimaryValue = 0xFF7692FF;
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      100: Color(0xffE4F8F1),
      200: Color(0xffcbf2e3),
      300: Color(0xff99e6c6),
      400: Color(0xff67daaa),
      500: Color(0xFF7692FF),
      600: Color(0xff6b8c9e),
      700: Color(0xff5f7e8a),
      800: Color(0xff54777e),
      900: Color(0xff4a636a),
      1000: Color(0xff415859),
    },
  );
}
