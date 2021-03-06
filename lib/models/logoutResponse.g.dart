// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logoutResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = json['data']
    ..token = json['token']
    ..code = json['code'] as int;
}

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
      'code': instance.code,
    };
