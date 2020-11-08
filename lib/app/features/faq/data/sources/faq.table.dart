class FAQTable {
  static final String tableName = "faq";
  static final String columnId = "_id";
  static final String columnQuestion = "question";
  static final String columnAnswer = "answer";
  static final String columnColor = "color";

  int id;
  String question;
  String answer;
  int color;

  FAQTable(this.question, this.answer, this.color);

  Map toJson() => {
        columnId: id,
        columnQuestion: question,
        columnAnswer: answer,
        columnColor: color
      };

  static List<FAQTable> fromJsonList(List<dynamic> json) =>
      json.map((e) => FAQTable.fromJson(e)).toList();

  FAQTable.fromJson(Map<String, dynamic> json) {
    id = json[columnId];
    question = json[columnQuestion];
    answer = json[columnAnswer];
    color = json[columnColor];
  }

  static Map<String, dynamic> toMap(FAQTable object) {
    return <String, dynamic>{
      columnQuestion: object.question,
      columnAnswer: object.answer,
      columnColor: object.color
    };
  }

  static String create() => '''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnQuestion TEXT,
        $columnAnswer TEXT,
        $columnColor INTEGER
      )
      ''';

  static List<Map<String, dynamic>> initialData() => [
        toMap(FAQTable(
            "Qual é o propósito da Snowman Labs?",
            "Servir e impactar pessoas através de tecnologia e design.",
            0xFFFFBE00)),
        toMap(FAQTable(
            "Qual é a visão da Snowman Labs?",
            "Ampliar exponencialmente o potencial das empresas e das pessoas através de design e tecnologia.",
            0xFFFFBE00)),
      ];
}
