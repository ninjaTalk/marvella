// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse()
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>)
    ..success = json['success'] as bool;
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'success': instance.success,
    };
