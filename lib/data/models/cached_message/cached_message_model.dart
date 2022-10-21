class CachedMessageFields {
  static const String id = "_id";
  static const String message = "message";
  static const String dateTime = "date_time";
  static const String isUser = "is_user";
  static const String tableName = "message_table";
}

class CachedMessageModel {
  int? id;
  String message;
  DateTime dateTime;
  bool isUser;

  CachedMessageModel({
    this.id,
    required this.message,
    required this.dateTime,
    required this.isUser,
  });

  static CachedMessageModel fromJson(Map<String, Object?> json) {
    return CachedMessageModel(
      id: json[CachedMessageFields.id] as int? ?? 0,
      message: json[CachedMessageFields.message] as String? ?? "",
      dateTime: DateTime.tryParse(
          json[CachedMessageFields.dateTime] as String? ?? "")!,
      isUser: 1 == (json[CachedMessageFields.isUser] as int? ?? 0),
    );
  }

  Map<String, Object?> toJson() {
    return {
      CachedMessageFields.id: id,
      CachedMessageFields.message: message,
      CachedMessageFields.dateTime: dateTime.toString(),
      CachedMessageFields.isUser: isUser ? 1: 0,
    };
  }
}
