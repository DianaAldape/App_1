import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/appState.dart';
import '../services/userservices.dart';

class ModalNewNote extends StatefulWidget {
  const ModalNewNote({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalNewNote> createState() => _ModalNewNoteState();
}

class _ModalNewNoteState extends State<ModalNewNote> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        //padding: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //height: 200,
        child: Form(
          key: _formularioKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration:
                      const InputDecoration(labelText: "Titulo de la nota"),
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este campo es requerido';
                    }
                  },
                ),
                TextFormField(
                  controller: _contenidoController,
                  decoration: const InputDecoration(labelText: ('Contenido')),
                  maxLines: 10,
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este campo es requerido';
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta = await Provider.of<AppState>(context,
                                  listen: false)
                              .saveNotas(
                            _tituloController.text,
                            _contenidoController.text,
                          );

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Nota agregada correctamente'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Algo salió mal'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                        //
                      },
                      child: const Text('Aceptar'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
