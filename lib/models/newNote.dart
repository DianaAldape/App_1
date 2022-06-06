import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewNotePage extends StatefulWidget {
  //const NewTodoPage({Key? key}) : super(key: key);

  @override
  //State<NewTodoPage> createState() => _NewTodoPageState();
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage>
//with SingleTickerProviderStateMixin
{
  //late AnimationController _controller;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller2.dispose();
  }

  final GlobalKey<FormState> _formularioKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
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
                  key: _formularioKey2,
                  child: SingleChildScrollView(
                    child: Column(
                      //padding: const EdgeInsets.symmetric(horizontal: 12),
                      children: [
                        TextFormField(
                          //maxLines: 10,
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          },
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: _controller2,
                          onChanged: (text) => setState(() {}),
                          onFieldSubmitted: (titulo) {
                            Navigator.of(context).pop(titulo);
                            Navigator.of(context).pop(DateTime.now());
                          },
                          decoration: const InputDecoration(hintText: 'Título'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                  iconSize: 40,
                  icon: Icon(CupertinoIcons.arrow_right_circle),
                  onPressed: () {
                    if (_formularioKey2.currentState!.validate()) {
                      Navigator.of(context).pop(_controller2.text);
                    }
                  }),
            ],
          ),
        ],
      ),
    ));
  }
}
