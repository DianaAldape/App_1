// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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

class pageTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: theme.setTheme(ThemeData.dark()),
        title: Text('Tema'),
      ),
      body: Container(
        //padding: EdgeInsets.all(30),
        margin: const EdgeInsets.only(top: 60),
        width: 600,
        height: 250,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 234, 234),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(30.0)),
            FlatButton(
              color: Colors.red,
              child: const Text("Dark"),
              onPressed: () => theme.setTheme(ThemeData.dark()),
            ),
            FlatButton(
              color: Colors.red,
              child: Text("Night"),
              onPressed: () => theme.setTheme(ThemeData(
                //scaffoldBackgroundColor: Color(0xff303030),
                brightness: Brightness.dark,
                primaryColor: Color(0xff151E21),
                primaryColorLight: Color(0xff151E21),
                primaryColorDark: Color(0xff121212),
                //colorScheme: const ColorScheme.dark(),
                iconTheme: IconThemeData(color: Colors.black45),
                accentColor: Color(0xffFF6b35),
                buttonColor: Color.fromARGB(255, 198, 73, 27),
                //Caja de checkbox
                toggleableActiveColor: Colors.transparent,
                splashColor: Color.fromARGB(255, 95, 96, 96),
                unselectedWidgetColor: Color(0xffFF6b35),
                textSelectionColor: Color(0xffFfafcc),
                textSelectionHandleColor: Color(0xffFfafcc),
                cursorColor: Color(0xffFfafcc),
                hintColor: Color(0xffFfafcc),
              )),
            ),
            FloatingActionButton(
              foregroundColor: Colors.green,
              onPressed: () => theme.setTheme(ThemeData(
                  //brightness: Brightness.dark,
                  //colorScheme: ColorScheme.highContrastDark(),
                  //primaryColor: Color(0xffE0607E),
                  //scaffoldBackgroundColor: Color(0xffDBD3AD)
                  )),
            ),
          ],
        ),

        //floatingActionButton: FloatingActionButton(
        //child: const Icon(Icons.add),
        //onPressed: () => theme.setTheme(ThemeData()),
      ),
    );
  }
}
