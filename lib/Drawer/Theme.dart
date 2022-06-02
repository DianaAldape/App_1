import 'package:flutter/material.dart';

class selectTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tema"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        //leading: Container(
        //child: Image.asset('assets/images/logo.png'),
        //  ),
      ),
    );
  }
}
