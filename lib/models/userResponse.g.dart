// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>)
    ..token = json['token'] as String
    ..code = json['code'] as int;
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
      'code': instance.code,
    };
