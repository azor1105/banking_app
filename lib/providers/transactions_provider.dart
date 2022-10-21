import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/local_data/local_data.dart';
import 'package:banking_app/data/models/expense_types/expense_type_model.dart';
import 'package:banking_app/data/models/income_types/income_type_model.dart';
import 'package:banking_app/data/models/transactions/expenses/expense.dart';
import 'package:banking_app/data/models/transactions/incomes/income.dart';
import 'package:banking_app/data/models/transactions/universal/universal_transaction_main_model.dart';
import 'package:banking_app/data/models/transactions/universal/universal_transaction_model_data.dart';
import 'package:banking_app/data/repositories/transactions_repository.dart';
import 'package:banking_app/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider({required this.transactionsRepo}) {
    _init();
  }

  List<Expense> expenses = [];
  List<ExpenseTypeModel> expenseTypes = [];
  List<Income> incomes = [];
  List<IncomeTypeModel> incomeTypes = [];
  List<UniversalTransactionMainModel> universalItems = [];
  bool isExpense = true;
  int realIndex = 0;
  bool isLoading = false;
  List<UniversalTransactionMainModel> selectedTransactiosnOnTransactionScreen =
      [];

  final TransactionsRepository transactionsRepo;

  Future<void> _init() async {
    notify(true);
    String token =
        StorageRepository.getString(keyOfValue: SharedPrefKeys.accessToken)!;
    expenses = await transactionsRepo.getExpenses(token: token);
    expenseTypes = await transactionsRepo.getExpenseTypes();
    incomes = await transactionsRepo.getIncomes(token: token);
    incomeTypes = await transactionsRepo.getIncomeTypes();
    makeUniversalList();
    notify(false);
  }

  double getTotalIncomeBalance() {
    double totalIncome = 0;
    for (var main in universalItems) {
      for (var data in main.data) {
        if (!data.isExpense) {
          totalIncome += data.amount;
        }
      }
    }
    return totalIncome;
  }

  double getTotalExpenseBalance() {
    double totalExpense = 0;
    for (var main in universalItems) {
      for (var data in main.data) {
        if (data.isExpense) {
          totalExpense += data.amount;
        }
      }
    }
    return totalExpense;
  }

  List<double> getTotalExpensesInData() {
    List<double> totalExpenses = [];
    for (int i = 0; i < expenses.length; i++) {
      totalExpenses.add(getTotalExpenseInDataWithIndex(i));
    }
    return totalExpenses;
  }

  double getTotalExpenseInDataWithIndex(int index) {
    double balance = 0.0;
    for (var transaction in expenses[index].data) {
      balance += transaction.amount;
    }
    return balance;
  }

  double getTotalIncomeInDataWithIndex(int index) {
    double balance = 0.0;
    for (var transaction in incomes[index].data) {
      balance += transaction.amount;
    }
    return balance;
  }

  void makeUniversalList() {
    List<UniversalTransactionDataModel> datas = [];
    for (var element in expenses) {
      for (var e in element.data) {
        String expenseName = expenseTypes
            .firstWhere((element) => element.id == e.expenseId)
            .expenseType;
        datas.add(
          UniversalTransactionDataModel(
            isExpense: true,
            name: e.receiver.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.receiver.brandImage,
            typeName: expenseName,
            amount: e.amount,
            transactionTypeId: e.expenseId,
          ),
        );
      }
    }

    for (var element in incomes) {
      for (var e in element.data) {
        String expenseName = incomeTypes
            .firstWhere((element) => element.id == e.incomeId)
            .incomeType;
        datas.add(
          UniversalTransactionDataModel(
            isExpense: false,
            name: e.sender.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.sender.brandImage,
            typeName: expenseName,
            amount: e.amount,
            transactionTypeId: e.incomeId,
          ),
        );
      }
    }

    datas.sort((first, next) => next.dateTime.compareTo(first.dateTime));
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    List<DateTime> dateTimes = [];

    for (var data in datas) {
      dateTimes.add(
        DateTime(
          data.dateTime.year,
          data.dateTime.month,
          data.dateTime.day,
        ),
      );
    }

    dateTimes = dateTimes.toSet().toList();

    for (var dateTime in dateTimes) {
      universalItems.add(
        UniversalTransactionMainModel(
          data: datas
              .where((element) =>
                  element.dateTime.month == dateTime.month &&
                  element.dateTime.day == dateTime.day &&
                  element.dateTime.year == dateTime.year)
              .toList(),
          dateTimeOfTransactions: dateTime,
        ),
      );
    }
    changeSelectedTransactionsOnTransactionScreen();
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void changeValueRealIndex({required int index}) {
    realIndex = index;
    notifyListeners();
  }

  void changeValueIsExpense({required bool value}) {
    isExpense = value;
    notifyListeners();
  }

  void changeSelectedTransactionsOnTransactionScreen() {
    selectedTransactiosnOnTransactionScreen.clear();
    if (isExpense) {
      List<UniversalTransactionDataModel> datas = [];
      for (var transaction in expenses) {
        for (var data in transaction.data) {
          String expenseName = expenseTypes
              .firstWhere((element) => element.id == data.expenseId)
              .expenseType;
          datas.add(
            UniversalTransactionDataModel(
              name: data.receiver.name,
              dateTime: DateTime.parse(data.date),
              imageUrl: data.receiver.brandImage,
              typeName: expenseName,
              amount: data.amount,
              isExpense: true,
              transactionTypeId: data.expenseId,
            ),
          );
        }
        selectedTransactiosnOnTransactionScreen.add(
          UniversalTransactionMainModel(
            data: datas,
            dateTimeOfTransactions: DateTime.parse(transaction.transferDate),
          ),
        );
        datas = [];
      }
    } else {
      List<UniversalTransactionDataModel> datas = [];
      for (var transaction in incomes) {
        for (var data in transaction.data) {
          String incomeName = incomeTypes
              .firstWhere((element) => element.id == data.incomeId)
              .incomeType;
          datas.add(
            UniversalTransactionDataModel(
              name: data.sender.name,
              dateTime: DateTime.parse(data.date),
              imageUrl: data.sender.brandImage,
              typeName: incomeName,
              amount: data.amount,
              isExpense: false,
              transactionTypeId: data.incomeId,
            ),
          );
        }
        selectedTransactiosnOnTransactionScreen.add(
          UniversalTransactionMainModel(
            data: datas,
            dateTimeOfTransactions: DateTime.parse(transaction.transferDate),
          ),
        );
        datas = [];
      }
    }
    notifyListeners();
  }

  Color getHexColorOfTransactionType(int id) {
    if (isExpense) {
      return HexColor.fromHex(
          expenseTypes.where((element) => element.id == id).toList()[0].color);
    } else {
      return HexColor.fromHex(
          incomeTypes.where((element) => element.id == id).toList()[0].color);
    }
  }

  String getImageOfTransactionType(int id) {
    if (isExpense) {
      return expenseTypes.where((element) => element.id == id).toList()[0].icon;
    } else {
      return incomeTypes.where((element) => element.id == id).toList()[0].icon;
    }
  }
}
