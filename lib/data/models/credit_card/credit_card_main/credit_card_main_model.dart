import 'package:json_annotation/json_annotation.dart';
import '../credit_card_color/credit_card_color_model.dart';

part 'credit_card_main_model.g.dart';

@JsonSerializable(explicitToJson: false)
class CreditCardMainModel {
  @JsonKey(defaultValue: -1, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "card_type")
  String cardType;

  @JsonKey(defaultValue: "", name: "card_number")
  String cardNumber;

  @JsonKey(defaultValue: "", name: "bank_name")
  String bankName;

  @JsonKey(defaultValue: 0.0, name: "money_amount")
  double moneyAmount;

  @JsonKey(defaultValue: "", name: "card_currency")
  String cardCurrency;

  @JsonKey(defaultValue: "", name: "expire_date")
  String expireDate;

  @JsonKey(defaultValue: "", name: "icon_image")
  String iconImage;

  @JsonKey(name: "colors")
  CreditCardColorModel cardGradienColors;

  CreditCardMainModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.bankName,
    required this.moneyAmount,
    required this.cardCurrency,
    required this.expireDate,
    required this.iconImage,
    required this.cardGradienColors,
  });

  factory CreditCardMainModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardMainModelToJson(this);
}
