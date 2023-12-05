import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderBottom extends StatefulWidget {
  const CalenderBottom({Key? key}) : super(key: key);

  @override
  State<CalenderBottom> createState() => _CalenderBottom();
}

class _CalenderBottom extends State<CalenderBottom> {
  DateTime today = DateTime.now();
  Map<DateTime, List<dynamic>> events = {};

  TextEditingController _eventController = TextEditingController();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendar")),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2012, 10, 16),
              lastDay: DateTime.utc(2027, 12, 30),
              onDaySelected: _onDaySelected,
              ),
          ),
          SizedBox(height: 20),
          Text(
            "Events on $today", // tampilan pada acara
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: events[today]?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(events[today]?[index] ?? ''),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showAddDialog(context);
            },
            child: Text("Add Event"),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: TextFormField(
            cursorColor: Color(0xFF4C4DDC),
            controller: _eventController,
            decoration: InputDecoration(hintText: 'Enter event'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addEvent(today, _eventController.text);
                _eventController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  void _addEvent(DateTime date, String event) {
    setState(() {
      if (events[date] != null) {
        events[date]!.add(event);
      } else {
        events[date] = [event];
      }
    });
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
}
