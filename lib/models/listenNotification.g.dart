// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listenNotification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListenNotification _$ListenNotificationFromJson(Map<String, dynamic> json) {
  return ListenNotification()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Notifications.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as int;
}

Map<String, dynamic> _$ListenNotificationToJson(ListenNotification instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
