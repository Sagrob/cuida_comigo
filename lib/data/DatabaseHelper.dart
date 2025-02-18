import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance =  DatabaseHelper._instance();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cuida_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE categorias(
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria TEXT)
''');

  await db.execute('''
    CREATE TABLE users(
    id_user INTEGER PRIMARY KEY AUTOINCREMENT,
    user TEXT,
    email TEXT UNIQUE,
    password TEXT,
    categoria_id INTEGER,
    logado_in INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id)
    )
''');

await db.execute('''
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    produto TEXT,
    descricao TEXT,
    preco REAL,
    image_url TEXT
''');

  await db.insert('categorias', {'categoria': 'Idoso'});
  await db.insert('categorias', {'categoria': 'Idoso com Cuidaodor'});
  await db.insert('categorias', {'categoria': 'Cuidador'});
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }
// 255, 10, 192, 137
  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('users');
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> updateUserLoginStatus(int userId, bool isLoggedIn) async {
    Database db = await database;
    await db.update(
      'users',
      {'logado_in': isLoggedIn ? 1 : 0},
      where: 'id_user = ?',
      whereArgs: [userId],
    );
  }

  Future<int> insertMarketplaceItem(Map<String, dynamic> item) async {
    Database db = await database;
    return await db.insert('marketplace', item);
  }

  Future<List<Map<String, dynamic>>> getMarketplaceItems() async {
    Database db = await database;
    return await db.query('marketplace');
  }
}