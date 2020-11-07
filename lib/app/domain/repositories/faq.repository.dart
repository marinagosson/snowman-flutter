import 'package:snowman/app/data/sources/local/tables/faq.table.dart';

abstract class FAQRepositoryImp {
  Future<List<FAQTable>> allFAQ({String searchQuestion});
  Future<FAQTable> insert(FAQTable object);
}
