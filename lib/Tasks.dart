// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names
import 'dart:convert';
import 'dart:io';
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

  _removeChecked() {
    List<Todo> pending = [];
    for (var todo in _todos!) {
      if (!todo.done) pending.add(todo);
    }
    setState(() => _todos = pending);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
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
    );
  }
}
