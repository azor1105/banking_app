import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/local_data/local_data.dart';
import 'package:banking_app/data/models/credit_card/credit_card_main/credit_card_main_model.dart';
import 'package:banking_app/data/repositories/user_credit_card_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserCreditCardProvider extends ChangeNotifier {
  UserCreditCardProvider({
    required UserCreditCardRepository userCreditCardRepository,
  }) : _userCreditCardRepository = userCreditCardRepository {
    getUserCards();
  }

  bool isLoading = false;
  List<CreditCardMainModel> userCreditCards = [];
  final UserCreditCardRepository _userCreditCardRepository;
  final currencyFormatter = NumberFormat("#,##0.00", "en_US");

  Future<void> getUserCards() async {
    isLoading = true;
    notifyListeners();
    await StorageRepository.getInstance();
    userCreditCards = await _userCreditCardRepository.getUserCards(
      accessToken:
          StorageRepository.getString(keyOfValue: SharedPrefKeys.accessToken)!,
    );
    isLoading = false;
    notifyListeners();
  }

  String getUserTotalBalance() {
    int totalBalance = 0;
    for (var card in userCreditCards) {
      totalBalance += card.moneyAmount.toInt();
    }
    return currencyFormatter.format(totalBalance).toString();
  }

  String formatCurrency({required double moneyAmount}) {
    return currencyFormatter.format(moneyAmount).toString();
  }
}
