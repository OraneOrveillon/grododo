import 'package:flutter/material.dart';

import 'alarm.dart';

class AlarmModel extends ChangeNotifier {
  final Alarm alarm;

  AlarmModel({required this.alarm});

  void updateActivated(bool activated) {
    alarm.activated = activated;
    notifyListeners();
  }
}
