class NotasProvider {
  late List<Map<String, dynamic>> _notas;

  static final NotasProvider _instancia = NotasProvider._privado();

  NotasProvider._privado() {
    _notas = [
      {
        'titulo': "Flutter",
        'contenido': "Que onda con el modo null safety",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "App compu",
        'contenido':
            "Me falta: \n Calendario\nAcomodar botones de tareas y notas",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Prueba 3",
        'contenido': "Contenido de nota 3",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Prueba 4",
        'contenido': "Prueba de nota para editar",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Borrar",
        'contenido': "Nota de prueba para borrar ",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Tarea Servicio",
        'contenido': "Reproducir codigo\nAcomodar Git\netc",
        'fecha': DateTime.now(),
      },
    ];
  }

  factory NotasProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get notas {
    return _notas;
  }

  void agregarNota(Map<String, dynamic> nuevaNota) {
    _notas.add(nuevaNota);
  }

  void editarNota(
      Map<String, dynamic> nuevaNota, Map<String, dynamic> actualNota) {
    for (var i = 0; i < _notas.length; i++) {
      if (_notas[i] == actualNota) {
        _notas[i] = nuevaNota;
        break;
      }
    }
  }

  void eliminarNota(Map<String, dynamic> borrarNota) {
    _notas.remove(borrarNota);
  }
}
