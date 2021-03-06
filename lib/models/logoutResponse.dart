import 'package:json_annotation/json_annotation.dart';


part 'logoutResponse.g.dart';

@JsonSerializable()
class LogoutResponse {
      LogoutResponse();

  bool success;
  String message;
  dynamic data;
  dynamic token;
  int code;

  factory LogoutResponse.fromJson(Map<String,dynamic> json) => _$LogoutResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
