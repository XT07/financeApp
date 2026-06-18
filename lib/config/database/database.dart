import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database> getDB() async {
    if (_db != null) return _db!;

    _db = await openDatabase(
      join(await getDatabasesPath(), 'finance.db'),
      onCreate: (db, version) {
        return db.execute(
        '''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            categorie TEXT,
            description TEXT,
            value REAL
          )
        '''
        );
      },
      version: 1,
    );
    return _db!;
  }

  static Future<void> save(String categorie, String description, double value) async {
    final db = await getDB();
    await db.insert('expenses', {
      'categorie': categorie,
      'description': description,
      'value': value,
    });
  }

  static Future<List<Map<String, dynamic>>> all() async {
    final db = await getDB();
    return db.query('expenses');
  }

  static Future<List<Map<String, dynamic>>> byCategorie(String categorie) async {
    final db = await getDB();
    return db.query(
      'expenses',
      where: 'categorie = ?',
      whereArgs: [categorie],
    );
  }

  static Future<void> delete(int id) async {
    final db = await getDB();
    await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }
}