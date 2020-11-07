import 'package:snowman/app/features/home/data/sources/faq.table.dart';

abstract class FAQRepositoryImp {
  Future<List<FAQTable>> allFAQ({String searchQuestion});
  Future<FAQTable> insert(FAQTable object);
}
