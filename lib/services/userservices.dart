import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Models/note.dart';
//
//import 'models/note.dart';

class UserServices {
  Future<List<Note>> getNotes() async {
    List<Note> myNotes = [
      Note(titulo: 'Titulo 1', contenido: 'Hola'),
      Note(titulo: 'Titulo 2', contenido: 'Como'),
      Note(titulo: 'Titulo 3', contenido: 'Estas'),
    ];
    return myNotes;
  }

  Future<bool> saveNotes(String titulo, String contenido) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('notes')
          .push()
          .set({'title': titulo, 'body': contenido});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
