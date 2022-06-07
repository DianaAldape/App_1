import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Drawer/selectTheme.dart';
import 'Notas/Notas.dart';
import 'Notas/contenido.dart';
import 'Notas/formulario.dart';
import 'home_page.dart';

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
/*
class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider(
      create: (BuildContext (context) => AppState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        routes: {
          '/': (_) => HomePage(),
          'nuevo': (_) => const ModalNewNote(),
        },
        initialRoute: '/',
      ),
    );
  }
}
*/

//Clase original

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      initialRoute: HomePage.nombrePagina,
      routes: {
        HomePage.nombrePagina: (BuildContext context) => HomePage(),
        listadoPage.nombrePagina: (BuildContext context) => listadoPage(),
        FormularioPage.nombrePagina: (BuildContext context) => FormularioPage(),
        ContenidoPage.nombrePagina: (BuildContext context) => ContenidoPage(),
      },
    );
  }
}
