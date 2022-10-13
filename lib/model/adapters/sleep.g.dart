// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sleep.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepAdapter extends TypeAdapter<Sleep> {
  @override
  final int typeId = 2;

  @override
  Sleep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sleep(
      sleepTime: fields[0] as DateTime,
      awakeningTime: fields[1] as DateTime,
      quality: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Sleep obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.sleepTime)
      ..writeByte(1)
      ..write(obj.awakeningTime)
      ..writeByte(2)
      ..write(obj.quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
