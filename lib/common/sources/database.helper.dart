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
          FAQTable.columnQuestion: "Qual é o propósito da Snowman Labs?",
          FAQTable.columnAnswer:
              "Servir e impactar pessoas através de tecnologia e design.",
          FAQTable.columnColor: 0xFFFFBE00
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion: "Qual é a visão da Snowman Labs?",
          FAQTable.columnAnswer:
              "Ampliar exponencialmente o potencial das empresas e das pessoas através de design e tecnologia.",
          FAQTable.columnColor: 0xFFFE666B
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion:
              "Quais são os princípios e valores da Snowman Labs?",
          FAQTable.columnAnswer: '''Fé - que guia as nossas ações
              Qualidade - que nos move sempre a darmos o nosso melhor 
              Transparência - que constrói a confiança 
              Respeito - que honra as pessoas
              Relacionamento - que nos torna uma família 
              Comprometimento - que nos faz andar mais uma milha
              Impacto - que cria esperança''',
          FAQTable.columnColor: 0xFFFEB62D
        });
        await db.insert(FAQTable.tableName, {
          FAQTable.columnQuestion:
              "Quais stacks são utilizadas na Snowman Labs?",
          FAQTable.columnAnswer:
              "A Snow trabalha com diferentes stacks e tecnologias, entre elas estão Java/Kotlin para Android nativo, Swift para iOS, Flutter/Dart, Python, .NET, VueJS, NodeJS…",
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
