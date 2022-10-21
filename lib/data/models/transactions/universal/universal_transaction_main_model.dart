import 'package:banking_app/data/models/transactions/universal/universal_transaction_model_data.dart';

class UniversalTransactionMainModel {
  UniversalTransactionMainModel({
    required this.data,
    required this.dateTimeOfTransactions,
  });

  List<UniversalTransactionDataModel> data;
  DateTime dateTimeOfTransactions;
}
