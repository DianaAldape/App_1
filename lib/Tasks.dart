// ignore_for_file: deprecated_member_use

import 'dart:ffi';

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
  late List<Todo> _todos;

  @override
  void initState() {
    _todos = [
      Todo('Primero'),
      Todo('Segundo'),
      Todo('Tercero'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _todos[index].toggleDone();
            });
          },
          child: ListTile(
            leading: Checkbox(
              value: _todos[index].done,
              onChanged: (checked) {
                setState(() {
                  _todos[index].done = checked!;
                });
              },
            ),
            title: Text(
              _todos[index].what,
              style: TextStyle(
                decoration: (_todos[index].done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          //color: Colors.pink,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NewTodoPage(),
            ),
          );
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
