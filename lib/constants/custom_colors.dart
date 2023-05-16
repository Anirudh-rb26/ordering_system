import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CustomColors {
  Color backgroundColor = HexColor("#55423d");
  Color headlineColor = HexColor("#fffffe");
  Color paragraphColor = HexColor("#fff3ec");
  Color buttonColor = HexColor("#ffc0ad");
  Color buttonTextColor = HexColor("#271c19");
  Color highlightColor1 = HexColor("#ffc0ad");
  Color highlightColor2 = HexColor("#3a5550");
}
