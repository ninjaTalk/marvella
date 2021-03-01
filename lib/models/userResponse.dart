import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'userResponse.g.dart';

@JsonSerializable()
class UserResponse {
      UserResponse();

  String message;
  User data;
  bool success;

  factory UserResponse.fromJson(Map<String,dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
