import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/local_data/local_data.dart';
import 'package:banking_app/data/services/open_api_services.dart';

class AuthRepository {
  AuthRepository({
    required this.openApiServices,
  });

  OpenApiServices openApiServices;

  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return await openApiServices.registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    return await openApiServices.loginUser(
      email: email,
      password: password,
    );
  }

  void saveToken({required String token}) async {
    await StorageRepository.putString(
      key: SharedPrefKeys.accessToken,
      value: token,
    );
  }

  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await StorageRepository.putString(
      key: SharedPrefKeys.firstName,
      value: firstName,
    );
    await StorageRepository.putString(
      key: SharedPrefKeys.lastName,
      value: lastName,
    );
    await StorageRepository.putString(
      key: SharedPrefKeys.email,
      value: email,
    );
    await StorageRepository.putString(
      key: SharedPrefKeys.passwordEmail,
      value: password,
    );
  }
}
