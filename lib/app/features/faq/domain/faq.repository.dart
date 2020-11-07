import 'package:snowman/app/features/faq/data/sources/faq.table.dart';

abstract class FAQRepositoryImp {
  Future<List<FAQTable>> allFAQ({String searchQuestion});
  Future<FAQTable> insert(FAQTable object);
}
