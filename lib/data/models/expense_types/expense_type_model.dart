import 'package:json_annotation/json_annotation.dart';

part 'expense_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExpenseTypeModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "expense_type")
  String expenseType;

  @JsonKey(defaultValue: "", name: "color")
  String color;

  @JsonKey(defaultValue: "", name: "icon")
  String icon;

  ExpenseTypeModel({
    required this.id,
    required this.color,
    required this.icon,
    required this.expenseType,
  });

  factory ExpenseTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseTypeModelToJson(this);
}
