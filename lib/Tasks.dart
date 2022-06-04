// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Todo {
  String what;
  bool done;
  Todo(this.what) : done = false;

  Todo.fromJson(Map<String, dynamic> json)
      : what = json['what'],
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'what': what,
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
          leading: Checkbox(
            checkColor: Colors.blueAccent,
            activeColor: const Color.fromARGB(255, 208, 204, 204),
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

class NewTodoPage extends StatefulWidget {
  //const NewTodoPage({Key? key}) : super(key: key);

  @override
  //State<NewTodoPage> createState() => _NewTodoPageState();
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage>
//with SingleTickerProviderStateMixin
{
  //late AnimationController _controller;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("New Todo...")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (what) {
                Navigator.of(context).pop(what);
              },
            ),
            RaisedButton(
              child: const Text("Añadir"),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            )
          ],
        ));
  }
}
