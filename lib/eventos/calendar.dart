import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import 'page/event_editing_page.dart';
import 'widget/calendar_widget.dart';

class Calendar extends StatelessWidget {
  Calendar({Key? key}) : super(key: key);

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
      body: CalendarWidget(),
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
            .push(MaterialPageRoute(builder: (context) => EventEditingPage())),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
