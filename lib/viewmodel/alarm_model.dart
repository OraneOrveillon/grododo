import 'package:flutter/material.dart';

import '../model/alarm.dart';

class AlarmModel extends ChangeNotifier {
  final Alarm alarm;

  AlarmModel({required this.alarm});

  void updateTime(TimeOfDay time) {
    alarm.time = time;
    notifyListeners();
  }

  void updateRepetition(Repetition repetition) {
    alarm.repetition = repetition;
    notifyListeners();
  }

  void updateDuration(int duration) {
    alarm.duration = duration;
    notifyListeners();
  }

  void updateActivated(bool activated) {
    alarm.activated = activated;
    notifyListeners();
  }

  void updateFade(bool fade) {
    alarm.fade = fade;
    notifyListeners();
  }

  void updateVibrator(bool vibrator) {
    alarm.vibrator = vibrator;
    notifyListeners();
  }
}
