import 'package:flutter/material.dart';
import 'models/note.dart';
import 'services/userservices.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bool _switchValue = false;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const ModalNewNote();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        //future:  UserServices().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List myNotes = snapshot.data ?? [];
          return ListView(
            children: [
              for (Note note in myNotes)
                ListTile(
                  title: Text(note.titulo!),
                  subtitle: Text(note.contenido!),
                ),
            ],
          );
        },
      ),
    );
  }
}

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //height: 1700,
        child: Form(
          key: _formularioKey,
          child: SingleChildScrollView(
            child: Column(
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
                          bool respuesta = await UserServices().saveNotes(
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
