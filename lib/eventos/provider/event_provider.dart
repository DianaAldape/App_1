import 'package:flutter/cupertino.dart';

import '../utils.dart';
import '../model/event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [
    Event(
      title: 'Reunion con Oscar',
      description: 'Actualizar repositorio',
      from: DateTime.now(),
      to: DateTime.now().add(Duration(hours: 2)),
    ),
    Event(
      title: 'Entrega proyecto',
      description: '',
      from: DateTime.now().subtract(Duration(hours: 6)),
      to: DateTime.now().add(Duration(hours: 4)),
    )
  ];

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events.where(
        (event) {
          final selected = Utils.removeTime(_selectedDate);
          final from = Utils.removeTime(event.from);
          final to = Utils.removeTime(event.to);

          return from.isAtSameMomentAs(selectedDate) ||
              to.isAtSameMomentAs(selectedDate) ||
              (selected.isAfter(from) && selected.isBefore(to));
        },
      ).toList();

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);

    notifyListeners();
  }

  void deleteEvent(Event event) {
    _events.remove(event);

    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;

    notifyListeners();
  }
}
