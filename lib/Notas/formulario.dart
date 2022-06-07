import 'package:flutter/cupertino.dart';
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
  Map<String, dynamic> nota = {};
  DateTime fecha = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //Variable que hace que no funcione el flotting buttom
    try {
      nota = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    } catch (e) {
      print(e);
      //nota = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    }

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Flexible(
              child: Form(
                key: idForm,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: <Widget>[
                      _crearInputTitulo(),
                      _crearInputContenido(),
                      _crearBotonAgregar(context),
                    ],
                  ),
                ),
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
      validator: (String? dato) {
        if (dato!.isEmpty) {
          return 'Este campo es requerido';
        }
      },
      // ignore: unnecessary_null_comparison
      initialValue: (nota != null) ? nota['titulo'] : "",
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
        initialValue: (nota != null) ? nota['contenido'] : "",
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
      alignment: Alignment.bottomRight,
      // ignore: deprecated_member_use
      child: IconButton(
          iconSize: 40,
          icon: Icon(CupertinoIcons.arrow_right_circle),
          onPressed: () {
            if (idForm.currentState!.validate()) {
              idForm.currentState?.save();
              //nuevaNota['estado'] = false;
              Navigator.popAndPushNamed(context, listadoPage.nombrePagina);

              if (nota != null) {
                NotasProvider().editarNota(nuevaNota, nota);
                //Navigator.popUntil(
                //  context, ModalRoute.withName(HomePage.nombrePagina));
                //Navigator.popAndPushNamed(context, listadoPage.nombrePagina);
                Navigator.pop(context);
                Navigator.pushNamed(context, listadoPage.nombrePagina);
              } else {
                try {
                  NotasProvider().agregarNota(nuevaNota);
                } catch (e) {
                  print(e);
                }
                //Navigator.pop(context);
                Navigator.pushNamed(context, listadoPage.nombrePagina);
                //Navigator.popAndPushNamed(context, listadoPage.nombrePagina);
                //Nav
              }
            }
            /*(nota != null)
                ? const Icon(Icons.update)
                : const Icon(Icons.arrow_circle_right_rounded);*/
          }),
      /* 
      RaisedButton(
        onPressed: () {
          idForm.currentState?.save();
          //nuevaNota['estado'] = false;
          Navigator.popAndPushNamed(context, listadoPage.nombrePagina);

          if (nota != null) {
            NotasProvider().editarNota(nuevaNota, nota);
            //Navigator.popUntil(
            //  context, ModalRoute.withName(HomePage.nombrePagina));
            //Navigator.popAndPushNamed(context, listadoPage.nombrePagina);
            Navigator.pop(context);
            Navigator.pushNamed(context, listadoPage.nombrePagina);
          } else {
            try {
              NotasProvider().agregarNota(nuevaNota);
            } catch (e) {
              print(e);
            }
            //Navigator.pop(context);
            Navigator.pushNamed(context, listadoPage.nombrePagina);
            //Navigator.popAndPushNamed(context, listadoPage.nombrePagina);
            //Navigator.pop(context);
          }
        },
        // ignore: unnecessary_null_comparison
        child: //const Text("Agregar"),
            (nota != null) ? const Text("Actualizar") : const Text("Agregar"),
      ),*/
    );
  }
}
