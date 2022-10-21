import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/cached_message/cached_message_model.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._init();
  LocalDataBase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("messages.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final String totalPath = join(dbPath, fileName);
    return await openDatabase(totalPath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";

    /// Creating todo table
    await db.execute('''
    CREATE TABLE ${CachedMessageFields.tableName}(
      ${CachedMessageFields.id} $idType,
      ${CachedMessageFields.message} $textType,
      ${CachedMessageFields.dateTime} $textType,
      ${CachedMessageFields.isUser} $intType
    )
    ''');
  }

  // -------------------------- Cached ToDo services ----------------------------

  static Future<List<CachedMessageModel>> getAllCachedMessages() async {
    final db = await getInstance.database;
    final data = await db.query(CachedMessageFields.tableName);
    return data.map((json) => CachedMessageModel.fromJson(json)).toList();
  }

  static Future<int> insertCachedMessage(CachedMessageModel cachedMessageModel) async {
    final db = await getInstance.database;
    final id = await db.insert(CachedMessageFields.tableName, cachedMessageModel.toJson());
    return id;
  }
}
