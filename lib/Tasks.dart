// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'newTask.dart';

class Todo {
  String what;
  bool done;
  //DateTime fecha;

  Todo(this.what) : done = false;

  Todo.fromJson(Map<String, dynamic> json)
      : what = json['what'],
        //fecha = DateTime.parse(json['fecha'] as String),
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'what': what,
        //'fecha': fecha,
        'done': done,
      };

  void toggleDone() => done = !done;
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({
    Key? key,
  }) : super(key: key);

  static const nombrePagina = 'tareas';

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo>? _todos;

  @override
  void initState() {
    _readTodos();
    super.initState();
  }

  _readTodos() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/todos.json');
      List json = jsonDecode(await file.readAsString());
      List<Todo> todos = [];
      for (var item in json) {
        todos.add(Todo.fromJson(item));
      }
      super.setState(() => _todos = todos);
    } catch (e) {
      setState(() => _todos = []);
    }
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeTodos();
  }

  _writeTodos() async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Directory dir = directory;
      File file = File('${dir.path}/todos.json');
      String jsonText = jsonEncode(_todos);
      print(jsonText);
      await file.writeAsString(jsonText);
    } catch (e) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('No he podido grabar el fichero'),
      ));
    }
  }

  _buildList() {
    // ignore: unnecessary_null_comparison
    if (_todos == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _todos!.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          setState(() {
            _todos![index].toggleDone();
          });
        },
        child: ListTile(
          minVerticalPadding: 20,
          leading: Checkbox(
            //checkColor: Colors.blueAccent,
            activeColor: Color.fromARGB(74, 146, 145, 146),
            value: _todos![index].done,
            //groupValue: _todos,
            onChanged: (checked) {
              setState(() => _todos![index].done = checked!);
            },
          ),
          title: Text(
            _todos![index].what,
            style: TextStyle(
              //backgroundColor: Colors.red,
              //decorationColor: Colors.red,
              decoration: (_todos![index].done
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
            ),
          ),
          /*subtitle: Text(
            DateFormat('kk:mma, dd-MM-yyyy')
                .format(_todos![index].fecha)
                .toString(),
            style: TextStyle(color: Colors.grey),
          ),*/
        ),
      ),
    );
  }

  _removeChecked() {
    List<Todo> pending = [];
    for (var todo in _todos!) {
      if (!todo.done) pending.add(todo);
    }
    setState(() => _todos = pending);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //flexibleSpace: ,
        toolbarHeight: 55,
        toolbarOpacity: 0.6,
        excludeHeaderSemantics: true,
        title: const Text("Tareas"),
        elevation: 10,
        centerTitle: true,
      ),
      //backgroundColor: Colors.white,

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        activeBackgroundColor: Colors.red,
        activeForegroundColor: Colors.red,
        //backgroundColor: Colors.blueGrey,
        overlayColor: Colors.black,
        overlayOpacity: 0.2,
        spacing: 20,
        buttonSize: const Size(56, 56),
        childrenButtonSize: const Size(55.0, 55.0),
        spaceBetweenChildren: 18,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.delete_forever),
            label: 'Eliminar',
            onTap: () => _removeChecked(),
          ),
          SpeedDialChild(
              child: Icon(Icons.add),
              label: 'Nueva',
              onTap: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => NewTodoPage(),
                  ),
                )
                    .then((what) {
                  setState(() {
                    _todos!.add(Todo(what));
                  });
                });
              })
        ],
      ),
      body: _buildList(),
/*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _removeChecked,
            backgroundColor: Colors.transparent,
            heroTag: null,
            child: const Icon(CupertinoIcons.delete),
          ),
          const SizedBox(
            height: 100,
          ),
          FloatingActionButton(
            child: const Icon(
              CupertinoIcons.add,
              //color: Colors.pink,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (_) => NewTodoPage(),
                ),
              )
                  .then((what) {
                setState(() {
                  _todos!.add(Todo(what));
                });
              });
            },
          ),
        ],
      ),*/
    );
  }
}
