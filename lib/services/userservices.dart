import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/note.dart';
//
//import 'models/note.dart';

class UserServices {
  Future<List<Note>> getNotes() async {
    List<Note> myNotes = [];

    /*
    try {
      DataSnapshot snap = (await FirebaseDatabase.instance
          .reference()
          .child('notas')
          .once()) as DataSnapshot;
          
      if (snap.exists) {
        final size = snap.value!.lenght;
        for (var i = 0; i < size!; i++) {
          
        }
        snap.value.forEach((value) {
          Map mapa = {'key': key, ...value};
          Note newNote = Note(
            contenido: mapa['body'],
            key: mapa['key'],
            titulo: mapa['title'],
          );
          myNotes.add(newNote);
        });
        
      }
    } catch (e) {
      return myNotes;
    }
*/
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
