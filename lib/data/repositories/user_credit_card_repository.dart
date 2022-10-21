import 'package:banking_app/data/models/credit_card/credit_card_main/credit_card_main_model.dart';
import 'package:banking_app/data/services/secure_api_services.dart';

class UserCreditCardRepository {
  UserCreditCardRepository({required SecureApiServices secureApiServices})
      : _secureApiServices = secureApiServices;

  final SecureApiServices _secureApiServices;

  Future<List<CreditCardMainModel>> getUserCards(
      {required String accessToken}) async {
    return await _secureApiServices.getUserCards(
      accessToken: accessToken,
    );
  }
}
