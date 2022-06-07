import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/notas_provider.dart';
import 'contenido.dart';
import 'formulario.dart';

class listadoPage extends StatefulWidget {
  const listadoPage({Key? key}) : super(key: key);

  static const nombrePagina = 'listado';

  @override
  State<listadoPage> createState() => _listadoPageState();
}

class _listadoPageState extends State<listadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (NotasProvider().notas.isNotEmpty)
          ? ListView(children: _creatItem(context))
          : const Center(
              child: Text("No hay tareas pendientes"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, FormularioPage.nombrePagina),
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _creatItem(BuildContext context) {
    List<Widget> temporal = [];

    for (Map<String, dynamic> nota in NotasProvider().notas) {
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, ContenidoPage.nombrePagina,
            arguments: nota),
        title: Text("${nota['titulo']}"),
        subtitle: Text(
            DateFormat('kk:mma, dd-MM-yyyy').format(nota['fecha']).toString()),
        //trailing: (nota['fecha'])
        //? const Icon(Icons.star)
        //: const Icon(Icons.star_border),
      );
      temporal.add(item);
    }
    return temporal;
  }
}
