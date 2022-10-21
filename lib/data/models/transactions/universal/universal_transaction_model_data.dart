class UniversalTransactionDataModel {
  UniversalTransactionDataModel({
    required this.name,
    required this.dateTime,
    required this.imageUrl,
    required this.typeName,
    required this.amount,
    required this.isExpense,
    required this.transactionTypeId,
  });

  final DateTime dateTime;
  final String name;
  final double amount;
  final String typeName;
  final String imageUrl;
  final bool isExpense;
  final int transactionTypeId;
}
