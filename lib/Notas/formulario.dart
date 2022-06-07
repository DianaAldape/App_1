import 'package:flutter/material.dart';
import 'package:prueba2/home_page.dart';
import 'notas.dart';
import '../providers/notas_provider.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  static const nombrePagina = "formulario";

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> nuevaNota = {};
  //Map<String, dynamic> nota = {};
  DateTime fecha = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //Variable que hace que no funcione el flotting buttom

    //nota = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Form(
              key: idForm,
              child: Column(
                children: <Widget>[
                  _crearInputTitulo(),
                  _crearInputContenido(),
                  _crearBotonAgregar(context),
                ],
              ),
            ),
          ),
        ));
  }

  //----------------------------------------------------------
  //FUNCIONES
  //---------------------------------------------------------
  _crearInputTitulo() {
    return TextFormField(
      // ignore: unnecessary_null_comparison
      //initialValue: (nota != null) ? nota['titulo'] : "",
      textCapitalization: TextCapitalization.sentences,
      onSaved: (valor) {
        nuevaNota['titulo'] = valor;
        nuevaNota['fecha'] = DateTime.now();
      },
      decoration: const InputDecoration(hintText: "Titulo"),
    );
  }

  _crearInputContenido() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        // ignore: unnecessary_null_comparison
        //initialValue: (nota != null) ? nota['contenido'] : "",
        textCapitalization: TextCapitalization.sentences,
        onSaved: (valor) {
          nuevaNota['contenido'] = valor;
        },
        maxLines: null,
        decoration: const InputDecoration(hintText: "Contenido"),
      ),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          idForm.currentState?.save();
          //nuevaNota['estado'] = false;
          Navigator.popAndPushNamed(context, listadoPage.nombrePagina);

          //if (nota != null) {
          //NotasProvider().editarNota(nuevaNota, nota);
          //Navigator.popUntil(
          //  context, ModalRoute.withName(HomePage.nombrePagina));
          //} else {
          NotasProvider().agregarNota(nuevaNota);
          Navigator.restorablePopAndPushNamed(context, HomePage.nombrePagina);
          //Navigator.pop(context);
          //}
        },
        // ignore: unnecessary_null_comparison
        child: const Text("Agregar"),
        //(nota != null) ? const Text("Actualizar") : const Text("Agregar"),
      ),
    );
  }
}
