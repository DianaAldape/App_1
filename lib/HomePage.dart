import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/animation.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
          color: Color.fromARGB(33, 112, 113, 113),
          //buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.transparent,
          height: 70,
          animationCurve: Curves.easeInCirc,
          animationDuration: const Duration(milliseconds: 1200),
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
    bool _switchValue = false;
    bool prueba = true;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            //curve: Curves.slowMiddle,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/op5.jpg"),
                fit: BoxFit.cover,
                //opacity: 70.0,
                //scale: 30.0,
              ),
            ),
            child: Row(
              children: const <Widget>[Text("App")],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            //width: 20,
            //color: Color.fromARGB(42, 10, 10, 10),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text("Modo oscuro"),
                    ToggleSwitch(
                      minWidth: 50.0,
                      cornerRadius: 28.0,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      customIcons: const [
                        Icon(Icons.nightlight),
                        Icon(Icons.light_mode),
                      ],
                      radiusStyle: true,
                      onToggle: (index) {
                        if (index == 1) {
                          print(index);
                          theme.setTheme(ThemeData.dark());
                        } else {
                          print("Hola");
                          //theme.setTheme(ThemeData.light());
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(42, 10, 10, 10),
            height: 5,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          /*SwitchListTile(
            title: const Text("Modo Oscuro"),
            value: _switchValue,
            onChanged: (bool valueIn) {
              setState(() {
                _switchValue = valueIn;
              });
              theme.setTheme(ThemeData.light());
            },
            secondary: const Icon(Icons.nightlight),
          ),*/
          ListTile(
              title: const Text("Inicio"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text("Otro"),
              leading: const Icon(Icons.home),
              onTap: () {}),
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
