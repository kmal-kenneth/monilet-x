import 'package:flutter/material.dart';

class Palette {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Palette._();

  static const Color background = Color.fromRGBO(40, 44, 52, 1);
  static const SweepGradient baseGradient = SweepGradient(colors: <Color>[
    Color.fromRGBO(118, 146, 255, 1),
    Color.fromRGBO(53, 206, 141, 1)
  ], stops: <double>[
    0.0,
    1
  ]);

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
    },
  );
}
