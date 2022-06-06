import 'package:flutter/material.dart';
import 'models/note.dart';
import 'services/userservices.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Notes extends StatefulWidget {
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    //bool _switchValue = false;

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 10,
        spaceBetweenChildren: 10,
        closeManually: true,
        children: [
          SpeedDialChild(
            child: Icon(Icons.note_add),
            label: 'Nota',
            //onTap: () => showToast('Selected'),
          ),
          SpeedDialChild(
            child: Icon(Icons.event),
            label: 'Calendario',
          ),
          SpeedDialChild(
            child: Icon(Icons.task),
            label: 'Tarea',
          ),
        ],
      ),
      /*FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'nuevo');
          //showModalBottomSheet(
          //  context: context,
          // builder: (BuildContext context) {
          //   return const ModalNewNote();
        },*/
      //child: Icon(Icons.add),

      body: FutureBuilder(
        future: UserServices().getNotes(),
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
