import 'package:json_annotation/json_annotation.dart';
import 'design.dart';

part 'listenDesign.g.dart';

@JsonSerializable()
class ListenDesign {
      ListenDesign();

  bool success;
  String message;
  List<Design> data;
  int code;

  factory ListenDesign.fromJson(Map<String,dynamic> json) => _$ListenDesignFromJson(json);
  Map<String, dynamic> toJson() => _$ListenDesignToJson(this);
}
