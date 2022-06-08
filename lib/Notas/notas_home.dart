import 'package:flutter/material.dart';
import 'package:prueba2/Notas/formulario.dart';
import 'package:prueba2/Notas/notas.dart';

class NotasHome extends StatelessWidget {
  NotasHome({Key? key}) : super(key: key);

  static const nombrePagina = 'notas homre';

  /*static const nombrePagina = 'calendar';
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {*/
  /*CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listadoPage(),
      /*body: SfCalendar(
        view: CalendarView.month,
        initialDisplayDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        todayHighlightColor: Colors.grey,
        headerHeight: 40,
      ),*/

      /*body: CalendarWidget(),
      floatingActionButtonAnimator: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage())),
          child: Icon(Icons.add)),
*/
      /*
      
      appBar: AppBar(
        toolbarHeight: 55,
        title: const Text("Eventos"),
        toolbarOpacity: 0.6,
        centerTitle: true,
      ),*/
      //backgroundColor: Colors.white,
      /*body: //Text("Calendario"),
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //calendarController: _controller,
              focusedDay: DateTime.now(),
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
            ),
          ],
        ),
      ),
      */
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.blueAccent,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FormularioPage())),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
