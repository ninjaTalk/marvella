import 'package:json_annotation/json_annotation.dart';


part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
      Notifications();

  String judul;
  String keterangan;
  @JsonKey(name: 'is_seen') int isSeen;
  @JsonKey(name: 'tanggal_notifikasi') String tanggalNotifikasi;
  @JsonKey(name: 'waktu_yang_lalu') String waktuYangLalu;

  factory Notifications.fromJson(Map<String,dynamic> json) => _$NotificationsFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
