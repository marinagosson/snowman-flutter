import 'package:rxdart/subjects.dart';
import 'package:snowman/common/base/base_viewmodel.dart';

class NewFAQViewModel extends BaseViewModel {
  List<int> colors = [0xFF40C19E, 0xFFFE666B, 0xFFFEB62D, 0xFF10168B];

  final _streamColor = PublishSubject<int>();
  Stream<int> get streamColor => _streamColor.stream;

  void actionSetColor(int index) {
    _streamColor.add(colors.elementAt(index));
  }

  @override
  void clear() {
    _streamColor.close();
  }
}
