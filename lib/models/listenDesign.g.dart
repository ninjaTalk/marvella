// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listenDesign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListenDesign _$ListenDesignFromJson(Map<String, dynamic> json) {
  return ListenDesign()
    ..success = json['success'] as bool
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Design.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..code = json['code'] as int;
}

Map<String, dynamic> _$ListenDesignToJson(ListenDesign instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
