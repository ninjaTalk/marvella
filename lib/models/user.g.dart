// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..nama = json['nama'] as String
    ..noTelp = json['no_telp'] as String
    ..jk = json['jk'] as String
    ..alamat = json['alamat'] as String
    ..email = json['email'] as String
    ..statusUser = json['status_user'] as int
    ..role = json['role'] as int
    ..updatedAt = json['updated_at'] as String
    ..createdAt = json['created_at'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nama': instance.nama,
      'no_telp': instance.noTelp,
      'jk': instance.jk,
      'alamat': instance.alamat,
      'email': instance.email,
      'status_user': instance.statusUser,
      'role': instance.role,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
