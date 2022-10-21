import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/local_data/local_data.dart';
import 'package:flutter/cupertino.dart';

class PinProvider extends ChangeNotifier {
  PinProvider() {
    storagePassword = StorageRepository.getString(
            keyOfValue: SharedPrefKeys.securityPassword) ??
        "";
    if (storagePassword == "") {
      title = setPassCode;
    } else {
      title = enterYourPassCode;
    }
  }
  late String storagePassword;
  String title = '';
  String enteredPassword = "";
  String setPassCode = "Set your passcode";
  String enterYourPassCode = "Enter your passcode";
  String confirmYourPasscode = "Confirm your passcode";
  String settedPassword = "";

  Future<bool?> enterPassword({
    required String symbol,
    required bool deleteLastSymbol,
    required BuildContext context,
  }) async {
    if (deleteLastSymbol && enteredPassword.isNotEmpty) {
      if (enteredPassword.length == 1) {
        enteredPassword = "";
      } else {
        enteredPassword = enteredPassword.substring(
          0,
          enteredPassword.length - 1,
        );
      }
    } else {
      if (enteredPassword.length < 4) {
        enteredPassword += symbol;
      }
    }

    if (enteredPassword.length == 4) {
      if (enteredPassword == storagePassword && title == enterYourPassCode) {
        return true;
      } else if (title == setPassCode) {
        title = confirmYourPasscode;
        settedPassword = enteredPassword;
        enteredPassword = "";
      } else if (title == confirmYourPasscode &&
          settedPassword == enteredPassword) {
        await StorageRepository.putString(
          key: SharedPrefKeys.securityPassword,
          value: settedPassword,
        );
        return true;
      } else {
        return false;
      }
    }
    notifyListeners();
    return null;
  }

  void clearEnteredPassword() {
    enteredPassword = "";
    notifyListeners();
  }
}
