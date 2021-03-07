// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDesign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDesign _$OrderDesignFromJson(Map<String, dynamic> json) {
  return OrderDesign()
    ..idDetailPesanan = json['id_detail_pesanan'] as int
    ..idPesanan = json['id_pesanan'] as int
    ..jenisDesain = json['jenis_desain'] as String
    ..bahan = json['bahan'] as String
    ..file = json['file'] as String
    ..ukuran = json['ukuran'] as String
    ..keteranganTambahan = json['keterangan_tambahan'] as String
    ..harga = json['harga'] as String
    ..jumlah = json['jumlah'] as int;
}

Map<String, dynamic> _$OrderDesignToJson(OrderDesign instance) =>
    <String, dynamic>{
      'id_detail_pesanan': instance.idDetailPesanan,
      'id_pesanan': instance.idPesanan,
      'jenis_desain': instance.jenisDesain,
      'bahan': instance.bahan,
      'file': instance.file,
      'ukuran': instance.ukuran,
      'keterangan_tambahan': instance.keteranganTambahan,
      'harga': instance.harga,
      'jumlah': instance.jumlah,
    };
