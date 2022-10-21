import 'package:json_annotation/json_annotation.dart';

part 'income_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IncomeTypeModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "income_type")
  String incomeType;

  @JsonKey(defaultValue: "", name: "color")
  String color;

  @JsonKey(defaultValue: "", name: "icon")
  String icon;

  IncomeTypeModel({
    required this.color,
    required this.icon,
    required this.id,
    required this.incomeType,
  });

  factory IncomeTypeModel.fromJson(Map<String, dynamic> json) => _$IncomeTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeTypeModelToJson(this);
}