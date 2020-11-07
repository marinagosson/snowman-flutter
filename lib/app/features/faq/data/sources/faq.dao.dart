import 'package:snowman/app/features/faq/data/sources/faq.table.dart';
import 'package:snowman/common/sources/database.helper.dart';
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

  Future<List<FAQTable>> queryAll({String searchQuestion}) async {
    String sql = 'SELECT * FROM ${FAQTable.tableName}';

    if (searchQuestion != null && searchQuestion.isNotEmpty)
      sql += " WHERE ${FAQTable.columnQuestion} LIKE $searchQuestion";

    List<Map<String, dynamic>> result = await _database.rawQuery(sql);
    return result.map((e) => FAQTable.fromJson(e));
  }
}
