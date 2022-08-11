class Alarm {
  final String time;
  final List<String> repetition;
  final int duration;
  bool activated;
  final bool fade;
  final bool vibrator;

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
        time: '9:OO',
        repetition: [Repetition.none],
        duration: 20,
      ),
      Alarm(
        time: '6:OO',
        repetition: [Repetition.monday, Repetition.thursday],
        duration: 20,
      ),
      Alarm(
          time: '6:3O',
          repetition: [
            Repetition.monday,
            Repetition.tuesday,
            Repetition.wednesday,
            Repetition.thursday,
            Repetition.friday,
          ],
          duration: 20),
      Alarm(
        time: '5:55',
        repetition: [Repetition.none],
        duration: 20,
        activated: false,
      ),
      Alarm(
        time: '7:OO',
        repetition: [Repetition.saturday, Repetition.sunday],
        duration: 20,
        activated: false,
      ),
    ];
  }
}

abstract class Repetition {
  static const String none = 'None';
  static const String monday = 'Mon';
  static const String tuesday = 'Tue';
  static const String wednesday = 'Wed';
  static const String thursday = 'Thu';
  static const String friday = 'Fri';
  static const String saturday = 'Sat';
  static const String sunday = 'Sun';
}
