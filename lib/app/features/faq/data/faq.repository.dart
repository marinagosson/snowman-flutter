import 'package:snowman/app/features/faq/data/sources/faq.dao.dart';
import 'package:snowman/app/features/faq/data/sources/faq.table.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/app/features/faq/domain/faq.repository.dart';

class FAQRepository implements FAQRepositoryImp {
  FAQDao _faqDao = FAQDao();

  @override
  Future<FAQ> insert(FAQ object) async {
    FAQTable faqTable = await _faqDao
        .insert(FAQTable(object.question, object.answer, object.color));
    return object..id = faqTable.id;
  }

  @override
  Future<List<FAQ>> allFAQ({String searchQuestion}) async {
    List<FAQTable> list =
        await _faqDao.queryAll(searchQuestion: searchQuestion);
    return list
        .map((e) =>
            FAQ(e.question, e.answer, e.color, id: e.id, isSelected: false))
        .toList();
  }
}
