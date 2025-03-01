// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'praytimemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerTimeModelAdapter extends TypeAdapter<PrayerTimeModel> {
  @override
  final int typeId = 0;

  @override
  PrayerTimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerTimeModel(
      code: fields[0] as int,
      status: fields[1] as String,
      data: fields[2] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerTimeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerTimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
