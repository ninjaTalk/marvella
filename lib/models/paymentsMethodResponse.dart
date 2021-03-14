import 'package:json_annotation/json_annotation.dart';
import 'paymentMethod.dart';

part 'paymentsMethodResponse.g.dart';

@JsonSerializable()
class PaymentsMethodResponse {
      PaymentsMethodResponse();

  bool success;
  String message;
  List<PaymentMethod> data;
  int code;

  factory PaymentsMethodResponse.fromJson(Map<String,dynamic> json) => _$PaymentsMethodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentsMethodResponseToJson(this);
}
