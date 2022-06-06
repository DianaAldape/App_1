import 'package:flutter/foundation.dart';
import 'package:prueba2/services/userservices.dart';

class AppState with ChangeNotifier {
  Future<bool> saveNotas(String text, String text2) async {
    try {
      return await UserServices().saveNotes(text, text2);
    } catch (e) {
      return false;
    }
  }
}
