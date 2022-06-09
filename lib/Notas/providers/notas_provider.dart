class NotasProvider {
  late List<Map<String, dynamic>> _notas;

  static final NotasProvider _instancia = NotasProvider._privado();

  NotasProvider._privado() {
    _notas = [
      {
        'titulo': "Servidor Linux",
        'contenido': "Usuario: daldape\nContraseña: daldape321",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Empresas (investigar)",
        'contenido': "- Vitalmex\n- Dalsitek",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Calificaciones Semestre 2022-2",
        'contenido':
            "- Robots Moviles : 9\n- Micros : 10\n- Admin. TIC : ?\n- Computo Móvil : ? ",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Prueba 1",
        'contenido': "Se realizo esta prueba para editar y eliminar",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Borrar",
        'contenido': "Otras nota de prueba para borrar ",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Tarea Servicio",
        'contenido': "- Reproducir codigo\n- Acomodar Git\n- ...",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Prueba 2",
        'contenido': "Se realizo esta otra prueba para editar y eliminar",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Lista Super",
        'contenido': "- Leche\n- Crema\n- Pan",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Canciones",
        'contenido': "  ",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Peliculas",
        'contenido': "  ",
        'fecha': DateTime.now(),
      },
      {
        'titulo': "Prueba",
        'contenido': "Esto es una prueba",
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
