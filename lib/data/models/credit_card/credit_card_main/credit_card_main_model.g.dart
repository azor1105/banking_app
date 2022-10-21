// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardMainModel _$CreditCardMainModelFromJson(Map<String, dynamic> json) =>
    CreditCardMainModel(
      id: json['id'] as int? ?? -1,
      cardType: json['card_type'] as String? ?? '',
      cardNumber: json['card_number'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      moneyAmount: (json['money_amount'] as num?)?.toDouble() ?? 0.0,
      cardCurrency: json['card_currency'] as String? ?? '',
      expireDate: json['expire_date'] as String? ?? '',
      iconImage: json['icon_image'] as String? ?? '',
      cardGradienColors:
          CreditCardColorModel.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditCardMainModelToJson(
        CreditCardMainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_type': instance.cardType,
      'card_number': instance.cardNumber,
      'bank_name': instance.bankName,
      'money_amount': instance.moneyAmount,
      'card_currency': instance.cardCurrency,
      'expire_date': instance.expireDate,
      'icon_image': instance.iconImage,
      'colors': instance.cardGradienColors,
    };
