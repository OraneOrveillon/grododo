import 'package:hive/hive.dart';

part 'adapters/sleep.g.dart';

@HiveType(typeId: 2)
class Sleep {
  @HiveField(0)
  final DateTime sleepTime;
  @HiveField(1)
  final DateTime awakeningTime;
  @HiveField(2)
  final int quality;

  Sleep({required this.sleepTime, required this.awakeningTime, required this.quality});
}
