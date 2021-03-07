// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : Order.fromJson(json['data'] as Map<String, dynamic>)
    ..code = json['code'] as int;
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
