import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../data/local_data/local_data.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.authRepository}) {
    _init();
  }

  bool animateOpacity = false;
  bool isLoading = false;
  AuthState authState = AuthState.start;
  final AuthRepository authRepository;
  bool loginPasswordVisibility = false;
  bool registerPasswordVisibility = false;
  bool registerConfirmPasswordVisibility = false;

  Future<void> animateOpacityWelcomeScreen() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    animateOpacity = true;
    notifyListeners();
  }

  Future<void> _init() async {
    await StorageRepository.getInstance();
    String firstName =
        StorageRepository.getString(keyOfValue: SharedPrefKeys.firstName) ?? "";
    String token =
        StorageRepository.getString(keyOfValue: SharedPrefKeys.accessToken) ??
            "";
    if (firstName.isNotEmpty) {
      if (token.isNotEmpty) {
        authState = AuthState.logged;
      } else {
        authState = AuthState.registered;
      }
    } else {
      authState = AuthState.notRegistered;
    }
    notifyListeners();
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    String token = await authRepository.loginUser(
      email: email,
      password: password,
    );
    authRepository.saveToken(token: token);
    authState = AuthState.logged;
    isLoading = false;
    notifyListeners();
  }

  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    bool isRegistered = await authRepository.registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    if (isRegistered) {
      authState = AuthState.registered;
      await authRepository.saveUserData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
    }
    isLoading = false;
    notifyListeners();
  }

  void changeLoginPasswordVisibility() {
    loginPasswordVisibility = !loginPasswordVisibility;
    notifyListeners();
  }

  void changeRegisterPasswordVisibility() {
    registerPasswordVisibility = !registerPasswordVisibility;
    notifyListeners();
  }

  void changeRegisterConfirmPasswordVisibility() {
    registerConfirmPasswordVisibility = !registerConfirmPasswordVisibility;
    notifyListeners();
  }
}
