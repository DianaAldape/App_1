// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

ThemeData Tema1(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff25ced1),
    accentColor: const Color(0xfffceade),
    unselectedWidgetColor: const Color(0xfffceade),
    cardColor: Colors.red[100],
    appBarTheme: const AppBarTheme(backgroundColor: const Color(0xff25ced1)),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffff8a5b)),
      fillColor: MaterialStateProperty.all(const Color(0xffea526f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff9d5e)),
    ),
  );
}

ThemeData Tema2(BuildContext context) {
  return ThemeData(
    //scaffoldBackgroundColor: Color(0xff303030),
    brightness: Brightness.light,
    //primarySwatch: Colors.red,
    primaryColor: const Color(0xff1a659e),
    //primaryColorLight: Color.fromARGB(255, 241, 128, 162),
    //primaryColorDark: Color.fromARGB(255, 95, 35, 53),
    //colorScheme: const ColorScheme.dark(),
    //iconTheme: const IconThemeData(color: Colors.black45),
    accentColor: const Color(0xff004e89),
    //buttonColor: Color.fromARGB(255, 198, 73, 27),
    //Barra inferior
    //toggleableActiveColor: Colors.blue,
    //splashColor: Color.fromARGB(255, 0, 255, 96)
    unselectedWidgetColor: const Color(0xffff6b35),
    appBarTheme: const AppBarTheme(backgroundColor: const Color(0xff1a659e)),
    //bannerTheme: MaterialBannerTheme(),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffff6b35)),
      fillColor: MaterialStateProperty.all(const Color(0xfff7c59f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff6b35)),
    ),
  );
}

ThemeData Tema3(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff25ced1),
    unselectedWidgetColor: const Color(0xfffceade),
    cardColor: Colors.red[100],
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff25ced1)),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffff8a5b)),
      fillColor: MaterialStateProperty.all(const Color(0xffea526f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff9d5e)),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xfffceade)),
  );
}

// ignore: non_constant_identifier_names
ThemeData Tema4(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffe0607e),
    accentColor: const Color(0xfff6c5af),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffe0607e),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffdbd3ad)),
      fillColor: MaterialStateProperty.all(const Color(0xfff6c5af)),
    ),
  );
}

ThemeData Tema5(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0XFFDA344D),
    accentColor: const Color(0xffD91E36),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFFDA344D),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffEf7674)),
      fillColor: MaterialStateProperty.all(const Color(0xffEC5766)),
    ),
  );
}

ThemeData Tema6(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffdbfeb8),
    accentColor: const Color(0xffc5edac),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff7a918d),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffdbfeb8)),
      fillColor: MaterialStateProperty.all(const Color(0xff99c2a2)),
    ),
  );
}

ThemeData Tema7(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xfffc9f5b),
    accentColor: const Color(0xff7dcfb6),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffc9f5b),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffece4b7)),
      fillColor: MaterialStateProperty.all(const Color(0xff33ca7f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff9d5e)),
    ),
  );
}

ThemeData Tema8(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffadc698),
    accentColor: const Color(0xffc05746),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffadc698),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffffffff)),
      fillColor: MaterialStateProperty.all(const Color(0xff503047)),
    ),
  );
}

// ignore: non_constant_identifier_names
ThemeData Tema9(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(169, 52, 35, 166),
    accentColor: const Color(0xff171738),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff3423a6),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffdff3e4)),
      fillColor: MaterialStateProperty.all(const Color(0xff2e1760)),
    ),
  );
}

ThemeData AtualTheme(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xff3423a6),
  );
}
