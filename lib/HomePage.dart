import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/Drawer/Theme.dart';
import 'Calendar.dart';
import 'Notes.dart';
import 'Tasks.dart';
import '/Drawer/Settings.dart';
import '/Drawer/Share.dart';
import '/Drawer/Theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //List<ScreenHiddenDrawer> itens = [];

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  bool selected = false;
  final screens = [
    Calendar(),
    const TodoListPage(),
    Notes(),
  ];
/*  --------------------HIDDEN DRAWER MENU------------------------
  @override
  void initState() {
    //var selectedStyle2 = null;
    // ignore: unnecessary_new, avoid_init_to_null
    itens.add(ScreenHiddenDrawer(
        // ignore: unnecessary_new
        new ItemHiddenMenu(
          name: "Inicio",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: TextStyle(color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
          //selectedStyle: selectedStyle2,
        ),
        Calendar()));

    //var selectedStyle3 = null;
    // ignore: unnecessary_new
    itens.add(ScreenHiddenDrawer(
        // ignore: unnecessary_new
        new ItemHiddenMenu(
          name: "Configuración",
          selected: true,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
          //selectedStyle: selectedStyle3,
        ),
        TodoListPage()));

    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = Provider.of<ThemeChanger>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    final _scaffKey = GlobalKey<ScaffoldState>();

    final items = <Widget>[
      const Icon(Icons.calendar_month_outlined, size: 30),
      const Icon(Icons.task_outlined, size: 30),
      const Icon(Icons.article_outlined, size: 30),
      // Icon(Icons.favorite,settings, person , size: 30),
    ];

    return Scaffold(
      key: _scaffKey,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Logo"),
        elevation: 0,
        centerTitle: true,
        //backgroundColor: Colors.blueAccent,
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            //iconTheme: const IconThemeData(color: Colors.white),
            //iconTheme: const IconThemeData(),
            ),
        child: CurvedNavigationBar(
          key: navigationKey,
          //color: Colors.blueAccent,
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      drawer: _getDrawer(context),
      //HiddenDrawerMenu(
      //backgroundColorMenu: Colors.grey,
      //screens: itens,
    );
  }

  Widget _getDrawer(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    bool switchValue = false;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red.shade100, Colors.blueAccent],
              ),
            ),
            child: Row(
              children: const <Widget>[Text("App")],
            ),
          ),
          SwitchListTile(
            title: const Text("Modo Oscuro"),
            value: switchValue,
            onChanged: (bool valueIn) {
              setState(() {
                switchValue = valueIn;
              });
              //theme.setTheme(ThemeData.light());
            },
            secondary: const Icon(Icons.nightlight),
          ),
          ListTile(
              title: const Text("Inicio"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text("Tema"),
              leading: const Icon(Icons.color_lens_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageTheme()),
                );
              }),
          ListTile(
              title: const Text("Compartir"),
              leading: const Icon(Icons.share),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Share()),
                );
              }),
          ListTile(
            title: const Text("Configuración"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),
    );
  }
}
