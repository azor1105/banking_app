// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseTypeModel _$ExpenseTypeModelFromJson(Map<String, dynamic> json) =>
    ExpenseTypeModel(
      id: json['id'] as int? ?? 0,
      color: json['color'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      expenseType: json['expense_type'] as String? ?? '',
    );

Map<String, dynamic> _$ExpenseTypeModelToJson(ExpenseTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_type': instance.expenseType,
      'color': instance.color,
      'icon': instance.icon,
    };
