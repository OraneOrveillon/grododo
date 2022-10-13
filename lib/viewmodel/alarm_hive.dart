import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/alarm.dart';

class AlarmHive extends ChangeNotifier {
  late final Box<Alarm> _box;
  late List<Alarm> alarms;

  AlarmHive(Box<Alarm> box) {
    _box = box;
    alarms = _box.values.toList();
  }

  void addAlarm(Alarm alarm) {
    _box.add(alarm);
    notifyListeners();
  }
}
