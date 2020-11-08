import 'package:rxdart/rxdart.dart';
import 'package:snowman/app/features/faq/data/faq.repository.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/base/base_viewmodel.dart';

class FAQSViewModel extends BaseViewModel {
  FAQRepository repository = FAQRepository();

  final streamExpandedList = PublishSubject();
  final streamListFAQs = PublishSubject<List<FAQ>>();

  List<FAQ> faqs = [];

  getAllFAQs() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    faqs = await repository.allFAQ();
    streamListFAQs.add(faqs);
    setLoading(false);
  }

  setExpanded(int index) {
    final bool isCurrent = faqs.elementAt(index).isSelected;
    faqs.forEach((element) => element.isSelected = false);
    if (!isCurrent) faqs.elementAt(index).isSelected = true;
    streamExpandedList.add(faqs);
  }

  @override
  void clear() {}
}
