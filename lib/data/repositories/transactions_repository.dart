import 'package:banking_app/data/models/expense_types/expense_type_model.dart';
import 'package:banking_app/data/models/income_types/income_type_model.dart';
import 'package:banking_app/data/models/transactions/expenses/expense.dart';
import 'package:banking_app/data/models/transactions/incomes/income.dart';
import '../services/open_api_services.dart';
import '../services/secure_api_services.dart';

class TransactionsRepository {
  TransactionsRepository({
    required this.secureApiService,
    required this.openApiService,
  });

  final SecureApiServices secureApiService;
  final OpenApiServices openApiService;

  Future<List<Expense>> getExpenses({required String token}) =>
      secureApiService.getExpenses(token: token);

  Future<List<ExpenseTypeModel>> getExpenseTypes() =>
      openApiService.getExpenseTypes();

  Future<List<Income>> getIncomes({required String token}) =>
      secureApiService.getIncomes(token: token);

  Future<List<IncomeTypeModel>> getIncomeTypes() =>
      openApiService.getIncomeTypes();
}
