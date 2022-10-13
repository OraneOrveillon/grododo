// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../alarm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<Alarm> {
  @override
  final int typeId = 0;

  @override
  Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alarm(
      time: fields[0] as TimeOfDay,
      repetition: fields[1] as Repetition,
      duration: fields[2] as int,
      activated: fields[3] as bool,
      fade: fields[4] as bool,
      vibrator: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Alarm obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.repetition)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.activated)
      ..writeByte(4)
      ..write(obj.fade)
      ..writeByte(5)
      ..write(obj.vibrator);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class RepetitionAdapter extends TypeAdapter<Repetition> {
  @override
  final int typeId = 1;

  @override
  Repetition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repetition(
      monday: fields[0] as bool,
      tuesday: fields[1] as bool,
      wednesday: fields[2] as bool,
      thursday: fields[3] as bool,
      friday: fields[4] as bool,
      saturday: fields[5] as bool,
      sunday: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Repetition obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.monday)
      ..writeByte(1)
      ..write(obj.tuesday)
      ..writeByte(2)
      ..write(obj.wednesday)
      ..writeByte(3)
      ..write(obj.thursday)
      ..writeByte(4)
      ..write(obj.friday)
      ..writeByte(5)
      ..write(obj.saturday)
      ..writeByte(6)
      ..write(obj.sunday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepetitionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
