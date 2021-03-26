// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return Notifications()
    ..judul = json['judul'] as String
    ..keterangan = json['keterangan'] as String
    ..isSeen = json['is_seen'] as int
    ..tanggalNotifikasi = json['tanggal_notifikasi'] as String
    ..waktuYangLalu = json['waktu_yang_lalu'] as String;
}

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'judul': instance.judul,
      'keterangan': instance.keterangan,
      'is_seen': instance.isSeen,
      'tanggal_notifikasi': instance.tanggalNotifikasi,
      'waktu_yang_lalu': instance.waktuYangLalu,
    };
