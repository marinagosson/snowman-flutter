import 'package:snowman/app/data/sources/database.helper.dart';
import 'package:snowman/app/data/sources/local/tables/faq.table.dart';
import 'package:sqflite/sqflite.dart';

class FAQDao {
  Database _database;

  FAQDao() {
    _getDatabaseInstance();
  }

  void _getDatabaseInstance() async =>
      _database = await DatabaseHelper.getInstance();

  Future<FAQTable> insert(FAQTable object) async {
    object.id = await _database.insert(FAQTable.tableName, object.toJson());
    return object;
  }
}
