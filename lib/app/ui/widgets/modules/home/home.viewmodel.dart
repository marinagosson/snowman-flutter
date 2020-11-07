import 'package:snowman/app/data/faq.repository.dart';
import 'package:snowman/core/base/base_viewmodel.dart';
import 'package:snowman/core/di/injector_provider.dart';

class HomeViewModel extends BaseViewModel {
  FAQRepository repository = inject<FAQRepository>();

  @override
  void clear() {}
}
