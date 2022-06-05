// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    // ignore: unnecessary_this
    this._themeData = theme;
    notifyListeners();
  }
}

// ignore: camel_case_types
class pageTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: theme.setTheme(ThemeData.dark()),
        title: const Text('Tema'),
      ),
      body: Container(
        //padding: EdgeInsets.all(30),
        margin: const EdgeInsets.only(top: 60),
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 234, 234),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Color solido"),
            //Padding(padding: EdgeInsets.all(30.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.max,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 21, 172, 175),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  //padding: const EdgeInsets.all(20),
                  color: Color(0xff25ced1),
                  child: const Text(" "),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xff25ced1),
                    //primaryColorLight: Color.fromARGB(255, 241, 128, 162),
                    //primaryColorDark: Color.fromARGB(255, 95, 35, 53),
                    accentColor: Color(0xfffceade),
                    unselectedWidgetColor: Color(0xfffceade),
                    cardColor: Colors.red[100],
                    appBarTheme:
                        AppBarTheme(backgroundColor: Color(0xff25ced1)),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffff8a5b)),
                      fillColor: MaterialStateProperty.all(Color(0xffea526f)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff9d5e)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xff004e89),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xff1a659e),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    //scaffoldBackgroundColor: Color(0xff303030),
                    brightness: Brightness.light,
                    //primarySwatch: Colors.red,
                    primaryColor: Color(0xff1a659e),
                    //primaryColorLight: Color.fromARGB(255, 241, 128, 162),
                    //primaryColorDark: Color.fromARGB(255, 95, 35, 53),
                    //colorScheme: const ColorScheme.dark(),
                    //iconTheme: const IconThemeData(color: Colors.black45),
                    accentColor: Color(0xff004e89),
                    //buttonColor: Color.fromARGB(255, 198, 73, 27),
                    //Barra inferior
                    //toggleableActiveColor: Colors.blue,
                    //splashColor: Color.fromARGB(255, 0, 255, 96)
                    unselectedWidgetColor: Color(0xffff6b35),
                    appBarTheme:
                        AppBarTheme(backgroundColor: Color(0xff1a659e)),
                    //bannerTheme: MaterialBannerTheme(),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffff6b35)),
                      fillColor: MaterialStateProperty.all(Color(0xfff7c59f)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff6b35)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xff3a405a),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xff99b2dd),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xff3a405a),
                    accentColor: Color(0xffe9afa3),
                    appBarTheme:
                        const AppBarTheme(backgroundColor: Color(0xff99b2dd)),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffe9afa3)),
                      fillColor: MaterialStateProperty.all(Color(0xfff9dec9)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff9d5e)),
                    ),
                  )),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.max,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xffd36060),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xffe0607e),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xffe0607e),
                    accentColor: Color(0xfff6c5af),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0xffe0607e),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffdbd3ad)),
                      fillColor: MaterialStateProperty.all(Color(0xfff6c5af)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0XFFDA344D),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xffD91E36),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0XFFDA344D),
                    accentColor: Color(0xffD91E36),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0XFFDA344D),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffEf7674)),
                      fillColor: MaterialStateProperty.all(Color(0xffEC5766)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xff93b1a7),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xff7a918d),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xffdbfeb8),
                    accentColor: Color(0xffc5edac),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0xff7a918d),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffdbfeb8)),
                      fillColor: MaterialStateProperty.all(Color(0xff99c2a2)),
                    ),
                  )),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.max,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xfffc9f5b),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xfffc9f5b),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xfffc9f5b),
                    accentColor: Color(0xff7dcfb6),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0xfffc9f5b),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xffece4b7)),
                      fillColor: MaterialStateProperty.all(Color(0xff33ca7f)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff9d5e)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 125, 49, 127),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xff793d7b),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xff793d7b),
                    accentColor: Color(0xff793d7b),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0xff793d7b),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xff4ca4e3)),
                      fillColor: MaterialStateProperty.all(
                          Color.fromARGB(131, 146, 145, 146)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff9d5e)),
                    ),
                  )),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color.fromARGB(224, 168, 157, 156),
                      width: 3,
                    ),
                  ),
                  height: 70,
                  minWidth: 70,
                  color: Color(0xff837fbb),
                  child: const Text(""),
                  onPressed: () => theme.setTheme(ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Color(0xff837fbb),
                    accentColor: Color(0xff837fbb),
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color(0xff837fbb),
                    ),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Color(0xff4ca4e3)),
                      fillColor: MaterialStateProperty.all(
                          Color.fromARGB(131, 146, 145, 146)),
                      overlayColor:
                          MaterialStateProperty.all(Color(0xffff9d5e)),
                    ),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
