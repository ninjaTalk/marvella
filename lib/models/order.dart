import 'package:json_annotation/json_annotation.dart';
import 'orderDesign.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
      Order();

  int id;
  @JsonKey(name: 'id_pemesan') int idPemesan;
  @JsonKey(name: 'tanggal_pemesanan') String tanggalPemesanan;
  @JsonKey(name: 'total_harga') String totalHarga;
  @JsonKey(name: 'bukti_bayar') String buktiBayar;
  @JsonKey(name: 'status_pesanan') String statusPesanan;
  @JsonKey(name: 'jenis_pembayaran') String jenisPembayaran;
  @JsonKey(name: 'id_jenis_pembayaran') int idJenisPembayaran;
  @JsonKey(name: 'id_status_pesanan') int idStatusPesanan;
  @JsonKey(name: 'status_pembayaran') String statusPembayaran;
  @JsonKey(name: 'detail_pesanan') List<OrderDesign> detailPesanan;

  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
