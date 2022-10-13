import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'adapters/alarm.g.dart';

@HiveType(typeId: 0)
class Alarm {
  @HiveField(0)
  TimeOfDay time;
  @HiveField(1)
  Repetition repetition;
  @HiveField(2)
  int duration;
  @HiveField(3)
  bool activated;
  @HiveField(4)
  bool fade;
  @HiveField(5)
  bool vibrator;

  Alarm({
    required this.time,
    required this.repetition,
    required this.duration,
    this.activated = true,
    this.fade = false,
    this.vibrator = false,
  });

  /// Default alarm when a new one is created
  factory Alarm.base() => Alarm(
        time: const TimeOfDay(hour: 20, minute: 0),
        repetition: Repetition(),
        duration: 10,
      );

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

@HiveType(typeId: 1)
class Repetition {
  @HiveField(0)
  bool monday;
  @HiveField(1)
  bool tuesday;
  @HiveField(2)
  bool wednesday;
  @HiveField(3)
  bool thursday;
  @HiveField(4)
  bool friday;
  @HiveField(5)
  bool saturday;
  @HiveField(6)
  bool sunday;

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
