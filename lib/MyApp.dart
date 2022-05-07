import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Tareas.dart';
import 'Calendario.dart';
import 'Notas.dart';
//import 'configuracion.dart'
//import 'temas.dart'


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    Calendario(),
    Tareas(),
    Notas(),
  ];

  @override
  Widget build(BuildContext context) {
    final _scaffKey = GlobalKey<ScaffoldState>();

    final items = <Widget>[
      Icon(Icons.calendar_month_outlined, size: 30),
      Icon(Icons.task_outlined, size: 30),
      Icon(Icons.article_outlined, size: 30),
      // Icon(Icons.favorite,settings, person , size: 30),
    ];

    return Scaffold(
      key: _scaffKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Logo"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blueAccent,
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      drawer: _getDrawer(context),
    );
  }

  Widget _getDrawer(BuildContext context) {
    return Drawer(

      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors:[
                    Colors.red.shade100,
                    Colors.blueAccent
                  ],
                ),
            ),
            child: Row(
              children: <Widget>[Text("App")],
            ),
          ),
          ListTile(
              title: Text("Inicio"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }
          ),
          ListTile(
            title: Text("Tema"),
            leading: Icon(Icons.color_lens_outlined),
            onTap: (){
            }
          ),
          ListTile(
              title: Text("Compartir"),
              leading: Icon(Icons.share),
              onTap: (){
              }
          ),
          ListTile(
            title: Text("Configuración"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Calendario()),
              );
            },
          ),
        ],
      ),
    );
  }
}
