import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Notas/Notas.dart';
import 'Notas/contenido.dart';
import 'Notas/formulario.dart';
import 'drawer/selectTheme.dart';
import 'eventos/provider/event_provider.dart';
import 'home_page.dart';
import 'tareas/newTask.dart';
import 'tareas/tasks.dart';

import 'package:flutter/services.dart';

//void main() {
//runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

//}

Future main() async {
  //Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xffe0607e),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffe0607e),
          ),
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(const Color(0xffdbd3ad)),
            fillColor: MaterialStateProperty.all(const Color(0xfff6c5af)),
          ),
          focusColor: Color(0xffe0607e),
          hoverColor: Color(0xffe0607e),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe0607e)),
            ),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Colors.grey,
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Color(0xfff6c5af)))),
      child: MaterialAppWithTheme(),
    );
/*
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: /*Provider<EventProvider>(
          create: (context) => EventProvider(), child: */
          MaterialAppWithTheme(),
    );*/

    /*
            create: (_) => ThemeChanger(ThemeData(
                  brightness: Brightness.light,
                  primaryColor: const Color(0xffe0607e),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xffe0607e),
                  ),
                  checkboxTheme: CheckboxThemeData(
                    checkColor:
                        MaterialStateProperty.all(const Color(0xffdbd3ad)),
                    fillColor:
                        MaterialStateProperty.all(const Color(0xfff6c5af)),
                  ),
                  focusColor: Color(0xffe0607e),
                  hoverColor: Color(0xffe0607e),
                  inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe0607e)),
                    ),
                  ),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: const Color(0xfff6c5af)),
                ))),
        Provider(*/

    // ignore: unused_label
    //create: (_) => ,
    /*builder: (context, child) {
          return MaterialAppWithTheme();*/
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.getTheme(),
          //home: SplashScreen(),
          initialRoute: HomePage.nombrePagina,

          routes: {
            HomePage.nombrePagina: (BuildContext context) => HomePage(),
            listadoPage.nombrePagina: (BuildContext context) => listadoPage(),
            FormularioPage.nombrePagina: (BuildContext context) =>
                FormularioPage(),
            ContenidoPage.nombrePagina: (BuildContext context) =>
                ContenidoPage(),
            TodoListPage.nombrePagina: (BuildContext context) => TodoListPage(),
            NewTodoPage.nombrePagina: (BuildContext context) => NewTodoPage()

            //pageTheme.nombrePagina:
          },
        ));
    //f
  }

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
