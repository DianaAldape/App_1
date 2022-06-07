import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  static const nombrePagina = 'compartir';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Compartir"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
