// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..nama = json['nama'] as String
    ..jk = json['jk'] as String
    ..alamat = json['alamat'] as String
    ..noTelp = json['no_telp'] as String
    ..email = json['email'] as String
    ..role = json['role'] as String
    ..statusUser = json['status_user'] as String
    ..deviceId = json['device_id'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'jk': instance.jk,
      'alamat': instance.alamat,
      'no_telp': instance.noTelp,
      'email': instance.email,
      'role': instance.role,
      'status_user': instance.statusUser,
      'device_id': instance.deviceId,
    };
