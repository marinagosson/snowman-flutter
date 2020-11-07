import 'package:snowman/app/data/sources/local/tables/faq.table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "SiziAppCM.db";
  static final _databaseVersion = 1;

  static Database _database;

  static Future<Database> getInstance() async {
    if (_database == null) {
      _database = await openDatabase(_databaseName, version: _databaseVersion,
          onCreate: (Database db, int version) async {
        await db.execute(FAQTable.create());
      });
    }
    return _database;
  }

  static close() async {
    await _database.close();
  }
}
