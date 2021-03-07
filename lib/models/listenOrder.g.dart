// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listenOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListenOrder _$ListenOrderFromJson(Map<String, dynamic> json) {
  return ListenOrder()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as int;
}

Map<String, dynamic> _$ListenOrderToJson(ListenOrder instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
