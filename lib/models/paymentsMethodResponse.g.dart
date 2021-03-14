// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentsMethodResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsMethodResponse _$PaymentsMethodResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentsMethodResponse()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PaymentMethod.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as int;
}

Map<String, dynamic> _$PaymentsMethodResponseToJson(
        PaymentsMethodResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
