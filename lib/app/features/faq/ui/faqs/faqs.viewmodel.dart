import 'package:rxdart/rxdart.dart';
import 'package:snowman/app/features/faq/data/faq.repository.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/base/base_viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';

class FAQSViewModel extends BaseViewModel {
  FAQRepository repository = inject<FAQRepository>();

  final streamExpandedList = PublishSubject();

  List<FAQ> faqs = [
    FAQ(
        1,
        "Em qual data foi fundada a Snowman Labs?",
        "A Snowman Labs foi fundada no dia 9 de agosto de 2012.",
        0xFF40C19E,
        false),
    FAQ(
        2,
        "Qual foi o primeiro cliente/ projeto que a Snow teve?",
        "O primeiro cliente que a Snow teve foi um candidato a deputado federal e fizemos o projeto dos santinhos digitais. Foi entregue em setembro de 2012.",
        0xFFFE666B,
        false),
    FAQ(
        3,
        "Por que foi escolhido o nome Snowman Labs? ",
        "Por conta da neve em Curitiba que ocorreu em 2013. Queríamos um mascote e a partir dele, surgiu o nome (foi a primeira coisa que pensamos na época). ",
        0xFFFEB62D,
        false),
    FAQ(
        4,
        "Quantos funcionários a Snow tinha no primeiro ano de existência?",
        "Em nosso primeiro ano éramos apenas 7 funcionários. ",
        0xFF10168B,
        false),
  ];

  setExpanded(int index) {
    final bool isCurrent = faqs.elementAt(index).isSelected;
    faqs.forEach((element) => element.isSelected = false);
    if (!isCurrent) faqs.elementAt(index).isSelected = true;
    streamExpandedList.add(faqs);
  }

  @override
  void clear() {
    // TODO: implement clear
  }
}
