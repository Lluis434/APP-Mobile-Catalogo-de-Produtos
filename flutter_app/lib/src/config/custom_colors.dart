import 'package:flutter/material.dart';

// Mapa de opacidades com base no roxo (Color(0xFF813FF2))
Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(129, 63, 242, .1),
  100: const Color.fromRGBO(129, 63, 242, .2),
  200: const Color.fromRGBO(129, 63, 242, .3),
  300: const Color.fromRGBO(129, 63, 242, .4),
  400: const Color.fromRGBO(129, 63, 242, .5),
  500: const Color.fromRGBO(129, 63, 242, .6),
  600: const Color.fromRGBO(129, 63, 242, .7),
  700: const Color.fromRGBO(129, 63, 242, .8),
  800: const Color.fromRGBO(129, 63, 242, .9),
  900: const Color.fromRGBO(129, 63, 242, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.white;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFF813FF2, _swatchOpacity);
}