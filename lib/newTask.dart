import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _controller,
                        onChanged: (text) => setState(() {}),
                        onSubmitted: (what) {
                          Navigator.of(context).pop(what);
                          Navigator.of(context).pop(DateTime.now());
                        },
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: const Text("Añadir"),
                onPressed: () {
                  Navigator.of(context).pop(_controller.text);
                },
              )
            ],
          ),
        ));
  }
}
