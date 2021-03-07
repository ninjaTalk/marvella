import 'package:json_annotation/json_annotation.dart';


part 'orderDesign.g.dart';

@JsonSerializable()
class OrderDesign {
      OrderDesign();

  @JsonKey(name: 'id_detail_pesanan') int idDetailPesanan;
  @JsonKey(name: 'id_pesanan') int idPesanan;
  @JsonKey(name: 'jenis_desain') String jenisDesain;
  String bahan;
  String file;
  String ukuran;
  @JsonKey(name: 'keterangan_tambahan') String keteranganTambahan;
  String harga;
  int jumlah;

  factory OrderDesign.fromJson(Map<String,dynamic> json) => _$OrderDesignFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDesignToJson(this);
}
