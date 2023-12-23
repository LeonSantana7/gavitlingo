import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  late Database _database;

  Future<void> initializeDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'gavitlingo.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT,
        email TEXT
      )
    ''');
  }

  Future<int> insertUser(String username, String password, String email) async {
    return await _database.insert('Users', {
      'username': username,
      'password': password,
      'email': email,
    });
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    return await _database.query('Users');
  }
}
