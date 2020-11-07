import 'package:snowman/app/features/home/data/faq.repository.dart';
import 'package:snowman/common/base/base_viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';

class HomeViewModel extends BaseViewModel {
  FAQRepository repository = inject<FAQRepository>();

  @override
  void clear() {}
}
