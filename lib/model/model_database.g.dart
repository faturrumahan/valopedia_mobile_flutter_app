// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteSkinAdapter extends TypeAdapter<FavoriteSkin> {
  @override
  final int typeId = 0;

  @override
  FavoriteSkin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteSkin(
      name: fields[1] as String,
      photo: fields[2] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, FavoriteSkin obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteSkinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
