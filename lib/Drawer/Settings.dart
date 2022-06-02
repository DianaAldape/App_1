import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Configuración"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
