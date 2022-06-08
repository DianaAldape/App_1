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
        title: Text("${nota['titulo']}"),
      ),
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        activeBackgroundColor: Colors.red,
        activeForegroundColor: Colors.red,
        //backgroundColor: Colors.blueGrey,
        overlayColor: Colors.black,
        overlayOpacity: 0.2,
        spacing: 20,
        buttonSize: const Size(60, 60),
        childrenButtonSize: const Size(58.0, 58.0),
        spaceBetweenChildren: 18,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
              child: Icon(Icons.delete_forever),
              //label: 'Eliminar',
              onTap: () {
                try {
                  NotasProvider().eliminarNota(nota);
                  Navigator.popAndPushNamed(context, listadoPage.nombrePagina);
                } catch (e) {
                  print(e);
                }
              }),
          SpeedDialChild(
            child: Icon(Icons.edit),
            //label: 'Editar',
            onTap: () {
              Navigator.pushNamed(context, FormularioPage.nombrePagina,
                  arguments: nota);
            },
            //onTap: () => showToast('Selected'),
          ),
          SpeedDialChild(
            child: Icon(Icons.share),
            //label: 'Editar',
            onTap: () {
              Share.share("${nota['contenido']}");
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            //textDirection: TextDirection.rtl,

            children: <Widget>[
              Text("${nota['contenido']}"),
              //),
/*
              RaisedButton(
                onPressed: () => Navigator.pushNamed(
                    context, FormularioPage.nombrePagina,
                    arguments: nota),
                child: const Text("Editar"),
              ),
              RaisedButton(
                onPressed: () {
                  NotasProvider().eliminarNota(nota);
                  Navigator.popAndPushNamed(context, HomePage.nombrePagina);
                },
                child: const Text("Borrar"),
              ),*/
            ],
          )),
    );
  }
}
