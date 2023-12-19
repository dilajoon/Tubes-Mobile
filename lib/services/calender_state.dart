import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventProvider extends ChangeNotifier {
  Map<DateTime, List<dynamic>> _events = {};

  Map<DateTime, List<dynamic>> get events => _events;

  Future<void> loadEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedEvents = prefs.getString('events');
    if (savedEvents != null) {
      _events = Map<DateTime, List<dynamic>>.from(
        Map<String, dynamic>.from(
          json.decode(savedEvents),
        ).map(
          (key, value) => MapEntry(DateTime.parse(key), List<dynamic>.from(value)),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> saveEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('events', json.encode(_events));
  }

  void addEvent(DateTime date, String event) {
    if (_events[date] != null) {
      _events[date]!.add(event);
    } else {
      _events[date] = [event];
    }
    saveEvents();
    notifyListeners();
  }
}