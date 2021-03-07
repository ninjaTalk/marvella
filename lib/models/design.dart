import 'package:json_annotation/json_annotation.dart';


part 'design.g.dart';

@JsonSerializable()
class Design {
      Design();

  @JsonKey(name: 'id_desain') int idDesain;
  @JsonKey(name: 'jenis_desain') String jenisDesain;
  String ukuran;
  String bahan;
  String harga;

  factory Design.fromJson(Map<String,dynamic> json) => _$DesignFromJson(json);
  Map<String, dynamic> toJson() => _$DesignToJson(this);
}
