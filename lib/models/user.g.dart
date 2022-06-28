// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      personID: fields[1] as String?,
      email: fields[2] as String?,
      name: fields[3] as String?,
      ic: fields[4] as String?,
      address: fields[5] as String?,
      phone: fields[6] as String?,
      occupation: fields[7] as String?,
      status: fields[8] as String?,
      mosqueID: fields[9] as String?,
      villageID: fields[10] as String?,
      expireMonth: fields[11] as int?,
      expireYear: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.personID)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.ic)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.occupation)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.mosqueID)
      ..writeByte(10)
      ..write(obj.villageID)
      ..writeByte(11)
      ..write(obj.expireMonth)
      ..writeByte(12)
      ..write(obj.expireYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
