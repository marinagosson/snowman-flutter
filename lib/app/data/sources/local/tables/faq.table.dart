class FAQTable {
  static final String tableName = "faq";
  static final String columnId = "_id";
  static final String columnQuestion = "question";
  static final String columnAnswer = "answer";

  int id;
  String question;
  String answer;

  Map toJson() =>
      {columnId: id, columnQuestion: question, columnAnswer: answer};

  static List<FAQTable> fromJsonList(List<dynamic> json) =>
      json.map((e) => FAQTable.fromJson(e)).toList();

  FAQTable.fromJson(Map<String, dynamic> json) {
    id = json[columnId];
    question = json[columnQuestion];
    answer = json[columnAnswer];
  }

  static String create() =>
      "CREATE TABLE $tableName (" +
      "$columnId INTEGER PRIMARY KEY" +
      "$columnQuestion TEXT NOT NULL" +
      "$columnAnswer TEXT NOT NULL";
}
