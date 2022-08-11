import 'package:flutter/material.dart';

import 'alarm.dart';

class AlarmProvider extends ChangeNotifier {
  final Alarm alarm;

  AlarmProvider({required this.alarm});

  void updateActivated(bool activated) {
    alarm.activated = activated;
    notifyListeners();
  }
}
