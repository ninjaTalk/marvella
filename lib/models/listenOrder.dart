import 'package:json_annotation/json_annotation.dart';
import 'order.dart';

part 'listenOrder.g.dart';

@JsonSerializable()
class ListenOrder {
      ListenOrder();

  bool success;
  String message;
  List<Order> data;
  int code;

  factory ListenOrder.fromJson(Map<String,dynamic> json) => _$ListenOrderFromJson(json);
  Map<String, dynamic> toJson() => _$ListenOrderToJson(this);
}
