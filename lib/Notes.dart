import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'models/newNote.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Nota {
  String titulo;
  //String contenido;
  bool done;
  DateTime fecha;

  Nota(this.titulo, this.fecha) : done = false;

  Nota.fromJson(Map<String, dynamic> json)
      : titulo = json['titulo'],
        //contenido = json['contenido'],
        fecha = DateTime.parse(json['fecha'] as String),
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        //'contenido': contenido,
        'fecha': fecha,
        'done': done,
      };

  void toggleDone() => done = !done;
}

class NotaListPage extends StatefulWidget {
  const NotaListPage({
    Key? key,
  }) : super(key: key);

  @override
  _NotaListPageState createState() => _NotaListPageState();
}

class _NotaListPageState extends State<NotaListPage> {
  List<Nota>? _notas;

  @override
  void initState() {
    _readNotas();
    super.initState();
  }

  _readNotas() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/notas.json');
      List json = jsonDecode(await file.readAsString());
      List<Nota> notas = [];
      for (var item in json) {
        notas.add(Nota.fromJson(item));
      }
      super.setState(() => _notas = notas);
    } catch (e) {
      setState(() => _notas = []);
    }
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeNotas();
  }

  _writeNotas() async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Directory dir = directory;
      File file = File('${dir.path}/notas.json');
      //DateTime jsonDateTime = JsonEncode(_notas);
      String jsonText = jsonEncode(_notas);
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
    if (_notas == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: _notas!.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  _notas![index].toggleDone();
                });
              },
              child: ListTile(
                minVerticalPadding: 20,
                leading: Title(
                  color: Colors.red,
                  child: Text(
                    _notas![index].titulo,
                    style: TextStyle(
                      //backgroundColor: Colors.red,
                      //decorationColor: Colors.red,
                      decoration: (_notas![index].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                    ),
                  ),

                  //Checkbox(
                  //checkColor: Colors.blueAccent,
                  //activeColor: Color.fromARGB(74, 146, 145, 146),
                  //value: _notas![index].done,
                  //groupValue: _todos,
                  //onChanged: (checked) {
                  //  setState(() => _notas![index].done = checked!);
                  //},
                ),
                subtitle: Text(
                  DateFormat('kk:mma, dd-MM-yyyy')
                      .format(_notas![index].fecha)
                      .toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
        /*
          title: Text(
            _notas![index].titulo,
            style: TextStyle(
              //backgroundColor: Colors.red,
              //decorationColor: Colors.red,
              decoration: (_notas![index].done
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
            ),
          ),
          subtitle: Text(
            DateFormat('kk:mma, dd-MM-yyyy')
                .format(_notas![index].fecha)
                .toString(),
            style: TextStyle(color: Colors.grey),
          ),*/
        );
  }

  _removeChecked() {
    List<Nota> pending = [];
    for (var todo in _notas!) {
      if (!todo.done) pending.add(todo);
    }
    setState(() => _notas = pending);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _buildList(),
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
                  builder: (_) => NewNotePage(),
                ),
              )
                  .then((titulo) {
                setState(() {
                  _notas!.add(Nota(titulo, DateTime.now()));
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
