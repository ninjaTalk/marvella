import 'package:json_annotation/json_annotation.dart';
import 'order.dart';

part 'orderResponse.g.dart';

@JsonSerializable()
class OrderResponse {
      OrderResponse();

  bool success;
  String message;
  Order data;
  int code;

  factory OrderResponse.fromJson(Map<String,dynamic> json) => _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
