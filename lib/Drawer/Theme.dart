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
        child: Column(
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(30.0)),
            FlatButton(
              color: Colors.red,
              child: const Text("Light"),
              onPressed: () => theme.setTheme(ThemeData.light()),
            ),
            FlatButton(
              color: Colors.red,
              child: Text("Night"),
              onPressed: () => theme.setTheme(ThemeData.fallback()),
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
