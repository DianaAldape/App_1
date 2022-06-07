// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/routes.dart';

import '../providers/notas_provider.dart';
import 'formulario.dart';

class ContenidoPage extends StatelessWidget {
  const ContenidoPage({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          //textDirection: TextDirection.rtl,

          children: <Widget>[
            Text("${nota['contenido']}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, FormularioPage.nombrePagina,
                      arguments: nota),
                  child: const Text("Editar"),
                ),
                RaisedButton(
                  onPressed: () {
                    NotasProvider().eliminarNota(nota);
                    Navigator.pop(context);
                  },
                  child: const Text("Borrar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
