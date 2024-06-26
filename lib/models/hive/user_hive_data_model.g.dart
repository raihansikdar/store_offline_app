// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveDataModelAdapter extends TypeAdapter<UserHiveDataModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveDataModel(
      id: fields[0],
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
