// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Design _$DesignFromJson(Map<String, dynamic> json) {
  return Design()
    ..idDesain = json['id_desain'] as int
    ..jenisDesain = json['jenis_desain'] as String
    ..ukuran = json['ukuran'] as String
    ..bahan = json['bahan'] as String
    ..harga = json['harga'] as String;
}

Map<String, dynamic> _$DesignToJson(Design instance) => <String, dynamic>{
      'id_desain': instance.idDesain,
      'jenis_desain': instance.jenisDesain,
      'ukuran': instance.ukuran,
      'bahan': instance.bahan,
      'harga': instance.harga,
    };
