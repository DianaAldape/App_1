// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/routes.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:prueba2/Notas/Notas.dart';
import 'package:prueba2/Notas/providers/notas_provider.dart';
import 'package:prueba2/home_page.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:share/share.dart';
import 'formulario.dart';

class ContenidoPage extends StatelessWidget {
  static const nombrePagina = 'Contenido';

  @override
  Widget build(BuildContext context) {
    //Object? tarea = ModalRoute.of(context)!.settings.arguments;

    Map<String, dynamic> nota =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        //leading: CloseButton(),
        actions: buildViewingActions(context, nota),
        //title: Text("${nota['titulo']}"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            //textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("${nota['titulo']}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),

              Text("${nota['contenido']}"),
              //),
            ],
          )),
    );
  }

  List<Widget> buildViewingActions(
          BuildContext context, Map<String, dynamic> nota) =>
      [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share("${nota['contenido']}");
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => {
            Navigator.pushNamed(context, FormularioPage.nombrePagina,
                arguments: nota),
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            try {
              NotasProvider().eliminarNota(nota);
              Navigator.popAndPushNamed(context, HomePage.nombrePagina);
            } catch (e) {
              print(e);
            }
          },
        ),
      ];
}
