import 'package:snowman/app/data/sources/local/daos/faq.dao.dart';
import 'package:snowman/app/data/sources/local/tables/faq.table.dart';
import 'package:snowman/app/domain/repositories/faq.repository.dart';

class FAQRepository implements FAQRepositoryImp {
  FAQDao _faqDao = FAQDao();

  @override
  Future<FAQTable> insert(FAQTable object) async {
    return await _faqDao.insert(object);
  }

  @override
  Future<List<FAQTable>> allFAQ({String searchQuestion}) async {
    return await _faqDao.queryAll(searchQuestion: searchQuestion);
  }
}
