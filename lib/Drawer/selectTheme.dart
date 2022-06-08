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
            padding: EdgeInsets.only(right: 20, left: 20),
            //margin: const EdgeInsets.only(top: 30),
            width: 600,
            height: 700,
            decoration: BoxDecoration(
              color: Color.fromARGB(117, 216, 213, 213).withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                      top: 50,
                      bottom: 10,
                    )),
                    Text(
                      "Elige un tema:",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                //Padding(padding: EdgeInsets.only(right: 20, left: 10)),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //FlatButton 1
                    FlatButton(
                      color: Color(0xff25ced1),
                      //colorBrightness: ,
                      /*shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: const BorderSide(
                          color: Color.fromARGB(255, 21, 172, 175),
                          width: 0,
                        ),
                      ),*/
                      height: 190,
                      minWidth: 120,
                      //padding: const EdgeInsets.only(left: 10),
                      //color: Color(0xff25ced1),
                      child: const Text(" "),
                      onPressed: () => theme.setTheme(Tema1(context)),
                    ),
                    //FlatButton 2
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xff1a659e),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema2(context)),
                    ),
                    //FlatButton 3
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xff99b2dd),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema3(context)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    //FlatButton 4
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Colors.yellow,
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema4(context)),
                    ),
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xffD91E36),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema5(context)),
                    ),
                    //FlatButton 6
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xff7a918d),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema6(context)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    //FlatButton 7
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xfffc9f5b),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema7(context)),
                    ),
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xffadc698),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema8(context)),
                    ),
                    FlatButton(
                      height: 190,
                      minWidth: 120,
                      color: Color(0xff3423a6),
                      child: const Text(""),
                      onPressed: () => theme.setTheme(Tema9(context)),
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
