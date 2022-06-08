import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewTodoPage extends StatefulWidget {
  static const nombrePagina = 'nuevaTarea';
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

  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Form(
                      key: _formularioKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                          //maxLines: 10,
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          },
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: _controller,
                          onChanged: (text) => setState(() {}),
                          onFieldSubmitted: (what) {
                            Navigator.of(context).pop(what);
                            Navigator.of(context).pop(DateTime.now());
                          },
                          decoration:
                              const InputDecoration(hintText: 'Nueva tarea'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 40,
                      icon: const Icon(CupertinoIcons.arrow_right_circle),
                      onPressed: () {
                        if (_formularioKey.currentState!.validate()) {
                          Navigator.of(context).pop(_controller.text);
                          //Navigator.pushNamed(
                          //  context, TodoListPage.nombrePagina);
                        }
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
