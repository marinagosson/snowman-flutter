import 'package:snowman/common/base/base_viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/features/home/data/faq.repository.dart';

class HomeViewModel extends BaseViewModel {
  FAQRepository repository = inject<FAQRepository>();

  @override
  void clear() {}
}
