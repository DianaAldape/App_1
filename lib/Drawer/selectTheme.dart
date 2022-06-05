// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Themes.dart';

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
    //ThemeData actualTheme;

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: theme.setTheme(ThemeData.dark()),
        title: const Text('Tema'),
      ),
      body: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //padding: EdgeInsets.all(30),
            //margin: const EdgeInsets.only(top: 30),
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              color: Color.fromARGB(117, 216, 213, 213).withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Padding(padding: EdgeInsets.all(25)),
                    Text(
                      "Elige un tema ",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                //Padding(padding: EdgeInsets.all(30.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //FlatButton 1
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 21, 172, 175),
                          width: 0,
                        ),
                      ),
                      height: 120,
                      minWidth: 100,
                      //padding: const EdgeInsets.all(20),
                      color: Color(0xff25ced1),
                      child: const Text(" "),
                      onPressed: () => theme.setTheme(Tema1(context)),
                    ),
                    //FlatButton 2
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
                      onPressed: () => theme.setTheme(Tema2(context)),
                    ),
                    //FlatButton 3
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
                      onPressed: () => theme.setTheme(Tema3(context)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    //FlatButton 4
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
                      onPressed: () => theme.setTheme(Tema4(context)),
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
                      onPressed: () => theme.setTheme(Tema5(context)),
                    ),
                    //FlatButton 6
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
                      onPressed: () => theme.setTheme(Tema6(context)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    //FlatButton 7
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
                      onPressed: () => theme.setTheme(Tema7(context)),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xffd0e3c4),
                          width: 3,
                        ),
                      ),
                      height: 70,
                      minWidth: 70,
                      color: Color(0xffadc698),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema8(context)),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xff7180b9),
                          width: 3,
                        ),
                      ),
                      height: 70,
                      minWidth: 70,
                      color: Color(0xff3423a6),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema9(context)),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xff7180b9),
                          width: 3,
                        ),
                      ),
                      height: 70,
                      minWidth: 70,
                      color: Color(0xff3423a6),
                      child: const Text(""),
                      onPressed: () {
                        theme.setTheme(Tema2(context));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
