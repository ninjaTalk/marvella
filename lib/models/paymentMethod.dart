import 'package:json_annotation/json_annotation.dart';


part 'paymentMethod.g.dart';

@JsonSerializable()
class PaymentMethod {
      PaymentMethod();

  int id;
  String jenis;

  factory PaymentMethod.fromJson(Map<String,dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
