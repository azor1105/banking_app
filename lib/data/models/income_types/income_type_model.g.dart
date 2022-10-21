// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeTypeModel _$IncomeTypeModelFromJson(Map<String, dynamic> json) =>
    IncomeTypeModel(
      color: json['color'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      incomeType: json['income_type'] as String? ?? '',
    );

Map<String, dynamic> _$IncomeTypeModelToJson(IncomeTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'income_type': instance.incomeType,
      'color': instance.color,
      'icon': instance.icon,
    };
