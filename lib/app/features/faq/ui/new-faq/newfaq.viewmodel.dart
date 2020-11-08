import 'package:rxdart/subjects.dart';
import 'package:snowman/app/features/faq/data/faq.repository.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/base/base_viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';

enum ButtonState { loading, enable, disable }

class NewFAQViewModel extends BaseViewModel {
  List<int> colors = [0xFF40C19E, 0xFFFE666B, 0xFFFEB62D, 0xFF10168B];

  FAQRepository repository = inject<FAQRepository>();

  final _question = BehaviorSubject<String>.seeded("");
  final _answer = BehaviorSubject<String>.seeded("");
  final _color = PublishSubject<int>();

  final button = PublishSubject<ButtonState>();

  Stream<int> get streamColor => _color.stream;

  int colorSelected;

  Future<bool> save() async {
    try {
      button.add(ButtonState.loading);
      await Future.delayed(Duration(seconds: 2));
      await repository
          .insert(FAQ(_question.value, _answer.value, colorSelected));
      button.add(ButtonState.enable);
      return true;
    } catch (err) {
      print(err);
      button.add(ButtonState.disable);
      return false;
    }
  }

  void setColor(int index) {
    colorSelected = colors.elementAt(index);
    _color.add(colorSelected);
    reloadButton();
  }

  void setQuestion(String value) {
    _question.add(value);
    reloadButton();
  }

  void setAnswer(String value) {
    _answer.add(value);
    reloadButton();
  }

  void reloadButton() {
    if (_question.value.isEmpty ||
        _answer.value.isEmpty ||
        colorSelected == null)
      button.add(ButtonState.disable);
    else
      button.add(ButtonState.enable);
  }

  @override
  void clear() {
    _question.add("");
    _answer.add("");
    _color.add(null);
    button.add(ButtonState.disable);
    colorSelected = null;
  }
}
