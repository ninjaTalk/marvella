import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
      User();

  int id;
  String nama;
  String jk;
  String alamat;
  @JsonKey(name: 'no_telp') String noTelp;
  String email;
  String role;
  @JsonKey(name: 'status_user') String statusUser;
  @JsonKey(name: 'device_id') String deviceId;
  String password;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
