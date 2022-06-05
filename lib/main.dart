import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Drawer/Theme.dart';
import 'HomePage.dart';

//void main() {
//runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

//}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // ignore: unused_label
      create: (_) => ThemeChanger(ThemeData()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: const HomePage());
  }
}
