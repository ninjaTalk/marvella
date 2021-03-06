import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'userResponse.g.dart';

@JsonSerializable()
class UserResponse {
      UserResponse();

  bool success;
  String message;
  User data;
  String token;
  int code;

  factory UserResponse.fromJson(Map<String,dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
