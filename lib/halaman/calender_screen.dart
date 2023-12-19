import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:wisata_app/services/calender_state.dart';
import 'package:intl/intl.dart';

class CalenderBottom extends StatefulWidget {
  const CalenderBottom({Key? key}) : super(key: key);

  @override
  State<CalenderBottom> createState() => _CalenderBottom();
}

class _CalenderBottom extends State<CalenderBottom> {
  DateTime today = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  late EventProvider _eventProvider;

  @override
  void initState() {
    super.initState();
    _eventProvider = Provider.of<EventProvider>(context, listen: false);
    _eventProvider.loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _eventProvider,
      child: Scaffold(
        appBar: AppBar(title: Text("Calendar")),
        body: content(),
      ),
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
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2012, 10, 16),
            lastDay: DateTime.utc(2027, 12, 30),
            onDaySelected: (day, focusedDay) {
                context.read<EventProvider>().loadEvents();
                setState(() {
                  today = day;
                });
            },

          ),
        ),
        SizedBox(height: 20),
        Text(
        "Events on ${DateFormat('yyyy-MM-dd').format(today)}", // Format to display only the date
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
        SizedBox(height: 10),
        Expanded(
          child: Consumer<EventProvider>(
            builder: (context, eventProvider, _) => ListView.builder(
              itemCount: eventProvider.events[today]?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(eventProvider.events[today]?[index] ?? ''),
                );
              },
            ),
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
              Provider.of<EventProvider>(context, listen: false)
                  .addEvent(today, _eventController.text);
              _eventController.clear();
            },
          ),
        ],
      );
    },
  );
}

@override
void dispose() {
  _eventController.dispose();
  super.dispose();
}
}
