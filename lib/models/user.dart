import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
      User();

  String nama;
  @JsonKey(name: 'no_telp') String noTelp;
  String jk;
  String alamat;
  String email;
  @JsonKey(name: 'status_user') int statusUser;
  int role;
  @JsonKey(name: 'updated_at') String updatedAt;
  @JsonKey(name: 'created_at') String createdAt;
  int id;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
