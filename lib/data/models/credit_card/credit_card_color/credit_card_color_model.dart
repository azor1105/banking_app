import 'package:json_annotation/json_annotation.dart';

part 'credit_card_color_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreditCardColorModel {
  @JsonKey(defaultValue: "", name: "color_a")
  String colorA;

  @JsonKey(defaultValue: "", name: "color_b")
  String colorB;

  CreditCardColorModel({
    required this.colorA,
    required this.colorB,
  });

  factory CreditCardColorModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardColorModelToJson(this);
}
