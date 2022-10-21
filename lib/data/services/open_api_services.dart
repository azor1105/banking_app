import 'dart:convert';
import 'package:banking_app/data/models/expense_types/expense_type_model.dart';
import 'package:banking_app/data/models/income_types/income_type_model.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class OpenApiServices {
  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await https.post(
        Uri.parse("https://banking-api.free.mockoapp.net/register_user"),
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body)["success"];
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    try {
      Response response = await https.post(
        Uri.parse("https://banking-api.free.mockoapp.net/login"),
        body: {"email": email, "password": password},
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body)["token"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ExpenseTypeModel>> getExpenseTypes() async {
    try {
      Response res = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/expense-types"));

      if (res.statusCode == 200) {
        List<ExpenseTypeModel> expenseTypes = (jsonDecode(res.body) as List?)
                ?.map((e) => ExpenseTypeModel.fromJson(e))
                .toList() ??
            [];
        return expenseTypes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<IncomeTypeModel>> getIncomeTypes() async {
    try {
      Response res = await https
          .get(Uri.parse("https://banking-api.free.mockoapp.net/income-types"));

      if (res.statusCode == 200) {
        List<IncomeTypeModel> incomeTypes = (jsonDecode(res.body) as List?)
                ?.map((e) => IncomeTypeModel.fromJson(e))
                .toList() ??
            [];
        return incomeTypes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
