import 'package:banking_app/data/db/local_database.dart';
import 'package:banking_app/data/models/cached_message/cached_message_model.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider() {
    _init();
  }
  List<CachedMessageModel> messages = [];

  bool isLoading = false;

  Future<void> _init() async {
    isLoading = true;
    notifyListeners();
    messages = await LocalDataBase.getAllCachedMessages();
    isLoading = false;
    notifyListeners();
  }

  void addMessage(CachedMessageModel cachedMessageModel) async {
    messages.add(cachedMessageModel);
    await LocalDataBase.insertCachedMessage(cachedMessageModel);
    notifyListeners();
  }
}
