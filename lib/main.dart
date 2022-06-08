import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/Tasks.dart';
import 'package:prueba2/drawer/selectTheme.dart';
import 'package:prueba2/newTask.dart';
import 'drawer/selectTheme.dart';
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
      create: (_) => ThemeChanger(ThemeData(
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
          focusColor: const Color(0xffe0607e),
          hoverColor: const Color(0xffe0607e),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffe0607e),
                //focusColor: Color(0xffe0607e),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe0607e)),
            ),
          ))),
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
      //home: SplashScreen(),
      initialRoute: HomePage.nombrePagina,

      routes: {
        HomePage.nombrePagina: (BuildContext context) => const HomePage(),
        listadoPage.nombrePagina: (BuildContext context) => const listadoPage(),
        FormularioPage.nombrePagina: (BuildContext context) =>
            const FormularioPage(),
        ContenidoPage.nombrePagina: (BuildContext context) =>
            const ContenidoPage(),
        TodoListPage.nombrePagina: (BuildContext context) =>
            const TodoListPage(),
        NewTodoPage.nombrePagina: (BuildContext context) => NewTodoPage()

        //pageTheme.nombrePagina:
      },
    );

    //Clase original

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
  }
}
