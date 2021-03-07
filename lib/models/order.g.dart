// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order()
    ..id = json['id'] as int
    ..idPemesan = json['id_pemesan'] as int
    ..tanggalPemesanan = json['tanggal_pemesanan'] as String
    ..totalHarga = json['total_harga'] as String
    ..buktiBayar = json['bukti_bayar'] as String
    ..statusPesanan = json['status_pesanan'] as String
    ..jenisPembayaran = json['jenis_pembayaran'] as String
    ..statusPembayaran = json['status_pembayaran'] as String
    ..detailPesanan = (json['detail_pesanan'] as List)
        ?.map((e) =>
            e == null ? null : OrderDesign.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'id_pemesan': instance.idPemesan,
      'tanggal_pemesanan': instance.tanggalPemesanan,
      'total_harga': instance.totalHarga,
      'bukti_bayar': instance.buktiBayar,
      'status_pesanan': instance.statusPesanan,
      'jenis_pembayaran': instance.jenisPembayaran,
      'status_pembayaran': instance.statusPembayaran,
      'detail_pesanan': instance.detailPesanan,
    };
