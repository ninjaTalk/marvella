import 'package:json_annotation/json_annotation.dart';
import 'notifications.dart';

part 'listenNotification.g.dart';

@JsonSerializable()
class ListenNotification {
      ListenNotification();

  bool success;
  String message;
  List<Notifications> data;
  int code;

  factory ListenNotification.fromJson(Map<String,dynamic> json) => _$ListenNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$ListenNotificationToJson(this);
}
