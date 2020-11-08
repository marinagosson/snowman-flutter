import 'package:path/path.dart';
import 'package:snowman/app/features/faq/data/sources/faq.table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "SnowmanLabs.db";
  static final _databaseVersion = 2;

  static Database _database;

  static Future<Database> getInstance() async {
    if (_database == null) {
      String documentsDb = await getDatabasesPath();
      String path = join(documentsDb, '$_databaseName');
      _database = await openDatabase(path, version: _databaseVersion,
          onCreate: (Database db, int version) async {
        await db.execute(FAQTable.create());
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion: "Em qual data foi fundada a Snowman Labs?",
          FAQTable.columnAnswer:
              "A Snowman Labs foi fundada no dia 9 de agosto de 2012.",
          FAQTable.columnColor: 0xFFFFBE00
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion:
              "Qual foi o primeiro cliente/ projeto que a Snow teve?",
          FAQTable.columnAnswer:
              "O primeiro cliente que a Snow teve foi um candidato a deputado federal e fizemos o projeto dos santinhos digitais. Foi entregue em setembro de 2012.",
          FAQTable.columnColor: 0xFFFE666B
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion:
              "Por que foi escolhido o nome Snowman Labs? ",
          FAQTable.columnAnswer:
              "Por conta da neve em Curitiba que ocorreu em 2013. Queríamos um mascote e a partir dele, surgiu o nome (foi a primeira coisa que pensamos na época).",
          FAQTable.columnColor: 0xFFFEB62D
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion:
              "Quantos funcionários a Snow tinha no primeiro ano de existência?",
          FAQTable.columnAnswer:
              "Em nosso primeiro ano éramos apenas 7 funcionários. ",
          FAQTable.columnColor: 0xFF10168B
        });
      }, onUpgrade: (db, oldVersion, newVersion) async {});
    }
    return _database;
  }

  static close() async {
    await _database.close();
  }
}
