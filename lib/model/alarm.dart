import 'package:flutter/material.dart';

class Alarm {
  TimeOfDay time;
  Repetition repetition;
  int duration;
  bool activated;
  bool fade;
  bool vibrator;

  Alarm({
    required this.time,
    required this.repetition,
    required this.duration,
    this.activated = true,
    this.fade = false,
    this.vibrator = false,
  });

  static List<Alarm> generateRandomAlarms() {
    return [
      Alarm(
        time: const TimeOfDay(hour: 9, minute: 0),
        repetition: Repetition(),
        duration: 20,
      ),
      Alarm(
        time: const TimeOfDay(hour: 6, minute: 0),
        repetition: Repetition(monday: true, thursday: true),
        duration: 20,
      ),
      Alarm(
          time: const TimeOfDay(hour: 6, minute: 30),
          repetition: Repetition(
            monday: true,
            tuesday: true,
            wednesday: true,
            thursday: true,
            friday: true,
          ),
          duration: 20),
      Alarm(
        time: const TimeOfDay(hour: 5, minute: 55),
        repetition: Repetition(),
        duration: 20,
        activated: false,
      ),
      Alarm(
        time: const TimeOfDay(hour: 7, minute: 0),
        repetition: Repetition(saturday: true, sunday: true),
        duration: 20,
        activated: false,
      ),
    ];
  }
}

class Repetition {
  bool monday, tuesday, wednesday, thursday, friday, saturday, sunday;

  Repetition({
    this.monday = false,
    this.tuesday = false,
    this.wednesday = false,
    this.thursday = false,
    this.friday = false,
    this.saturday = false,
    this.sunday = false,
  });

  @override
  String toString() {
    return '${!monday && !tuesday && !wednesday && !thursday && !friday && !saturday && !sunday ? 'None' : ''}'
        '${monday ? 'Mon ' : ''}'
        '${tuesday ? 'Tue ' : ''}'
        '${wednesday ? 'Wed ' : ''}'
        '${thursday ? 'Thu ' : ''}'
        '${friday ? 'Fri ' : ''}'
        '${saturday ? 'Sat ' : ''}'
        '${sunday ? 'Sun ' : ''}';
  }
}
