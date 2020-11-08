import 'faq.dart';

abstract class FAQRepositoryImp {
  Future<List<FAQ>> allFAQ({String searchQuestion});
  Future<FAQ> insert(FAQ object);
}
