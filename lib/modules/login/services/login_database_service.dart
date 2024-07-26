import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LoginDatabaseService {
  static final LoginDatabaseService _instance =
      LoginDatabaseService._internal();
  factory LoginDatabaseService() => _instance;

  LoginDatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'login_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)",
    );
    await db.insert(
      'users',
      {'email': 'a', 'password': '123'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Usuário de teste inserido: alan@gmail.com");
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: "email = ?",
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  // Adicione este método
  Future<void> initialize() async {
    await database; // Isso garante que o banco de dados seja inicializado
  }
}
