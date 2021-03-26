import 'package:json_annotation/json_annotation.dart';


part 'notification.g.dart';

@JsonSerializable()
class Notification {
      Notification();

  String judul;
  String keterangan;
  @JsonKey(name: 'is_seen') int isSeen;
  @JsonKey(name: 'tanggal_notifikasi') String tanggalNotifikasi;
  @JsonKey(name: 'waktu_yang_lalu') String waktuYangLalu;

  factory Notification.fromJson(Map<String,dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
