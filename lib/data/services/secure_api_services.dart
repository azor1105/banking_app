import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import '../models/credit_card/credit_card_main/credit_card_main_model.dart';
import '../models/transactions/expenses/expense.dart';
import '../models/transactions/incomes/income.dart';

class SecureApiServices {
  Future<List<CreditCardMainModel>> getUserCards(
      {required String accessToken}) async {
    try {
      Response response = await https.get(
        Uri.parse("https://banking-api.free.mockoapp.net/user_cards"),
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return (jsonDecode(response.body) as List?)
                ?.map((json) => CreditCardMainModel.fromJson(json))
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Expense>> getExpenses({required String token}) async {
    try {
      Response response = await https.get(
        Uri.parse(
            "https://banking-api.free.mockoapp.net/transactions-expenses"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        List<Expense> expenses = (jsonDecode(response.body) as List?)
                ?.map((e) => Expense.fromJson(e))
                .toList() ??
            [];
        return expenses;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Income>> getIncomes({required String token}) async {
    try {
      Response response = await https.get(
        Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        List<Income> incomes = (jsonDecode(response.body) as List?)
                ?.map((e) => Income.fromJson(e))
                .toList() ??
            [];
        return incomes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
