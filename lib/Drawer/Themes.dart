// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

ThemeData Tema1(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(37, 206, 209, 1),
    unselectedWidgetColor: Color(0xfffceade),
    cardColor: Colors.red[100],
    appBarTheme: AppBarTheme(backgroundColor: const Color(0xff25ced1)),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffff8a5b)),
      fillColor: MaterialStateProperty.all(const Color(0xffea526f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff9d5e)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff25ced1)),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xfff6c5af),
      primary: Color(0xff25ced1),
      primaryContainer: Color(0xffea526f),
      onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema2(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff1a659e)),
      ),
    ),
    //scaffoldBackgroundColor: Color(0xff303030),
    brightness: Brightness.light,
    //primarySwatch: Colors.red,
    primaryColor: Color(0xff1a659e),
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xff1a659e),
      primary: Color(0xffff6b35),
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema3(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff25ced1)),
      ),
    ),
    brightness: Brightness.light,
    primaryColor: Color(0xff99b2dd),
    unselectedWidgetColor: Color(0xffe9afa3),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff99b2dd)),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Color(0xff685040)),
      fillColor: MaterialStateProperty.all(Color(0xff3a405a)),
      overlayColor: MaterialStateProperty.all(Color(0xffff9d5e)),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xff99b2dd),
      primary: Color(0xffe9afa3),
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

// ignore: non_constant_identifier_names
ThemeData Tema4(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow),
      ),
    ),
    brightness: Brightness.light,
    //primaryColor: const Color(0xff25ced1),
    //accentColor: const Color(0xfffceade),
    primarySwatch: Colors.yellow,
    unselectedWidgetColor: const Color(0xfffceade),
    cardColor: Color.fromARGB(255, 253, 30, 186),
    //appBarTheme: const AppBarTheme(backgroundColor: const Color(0xff25ced1)),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xff7dcfb6)),
      fillColor: MaterialStateProperty.all(Colors.pinkAccent),
      overlayColor: MaterialStateProperty.all(Colors.grey),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.pinkAccent,
      primary: Colors.yellow,
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema5(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFFDA344D)),
      ),
    ),
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xffEC5766),
      primary: Colors.grey,
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema6(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff7a918d)),
      ),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xff7a918d),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff7a918d),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffdbfeb8)),
      fillColor: MaterialStateProperty.all(const Color(0xff99c2a2)),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xffdbfeb8),
      primary: Color(0xff7a918d),
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema7(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xfffc9f5b)),
      ),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xfffc9f5b),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffc9f5b),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffece4b7)),
      fillColor: MaterialStateProperty.all(const Color(0xff33ca7f)),
      overlayColor: MaterialStateProperty.all(const Color(0xffff9d5e)),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xffff9d5e),
      primary: Color(0xff33ca7f),
      primaryContainer: Colors.grey,
      //onPrimaryContainer: Color(0xffea526f),
    ),
  );
}

ThemeData Tema8(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffadc698)),
      ),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xffadc698),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffadc698),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(const Color(0xffffffff)),
      fillColor: MaterialStateProperty.all(const Color(0xff503047)),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color(0xffadc698),
          primary: Color(0xffc05746),
          primaryContainer: Color(0xff503047),
          //onPrimaryContainer: Color(0xffea526f),
        )
        .copyWith(secondary: const Color(0xffc05746)),
  );
}

// ignore: non_constant_identifier_names
ThemeData Tema9(BuildContext context) {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(169, 52, 35, 166)),
        ),
      ),
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
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xff7180b9),
        primary: Color(0xffdff3e4),
        primaryContainer: Color(0xff2e1760),
        //onPrimaryContainer: Color(0xffea526f),
      ));
}

ThemeData AtualTheme(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xff3423a6),
  );
}
